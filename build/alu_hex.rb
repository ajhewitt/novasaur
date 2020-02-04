def print_ext_addr(addr)
  print_data [2, 0, 0, 4, (addr >> 8) & 0xff, addr & 0xff]
end

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

def print_binary(op, offset, opts = {})
  mask = opts[:high] ? 0x0f : 0xf0
  mask = 0 unless opts[:pass]
  16.times.map do |a|
    16.times.map do |b|
      d = 16.times.map do |c|
        x = (b << 4) + c
        y = a << (opts[:high] ? 4 : 0)
        y = 0x10 if (op == '/' && a == 0)
        ((op ? x.send(op, y) : y) & 0xff) | (x & mask)
      end
      print_data([d.size, offset + a, b << 4, 0] + d)
    end
  end
end

def print_unary(offset, r)
  0.step(0xF0, 0x10).map do |a|
    print_data([0x10, offset, a, 0] + r[a..a+0xF])
  end
end

def print_av(offset)
  rom = Array.new(16) { Array.new(254, 0xFF) }
  sync = [true, false, true, false]
  vid = [[[[600,1,4,35], [600,1,4,35], [600,1,4,35], [576,13,4,47]],
          [[600,1,4,35], [600,1,4,35], [600,1,4,35], [600,1,4,35]]],
         [[[768,3,6,23], [768,3,6,23], [768,3,6,23]],
          [[768,3,6,23], [768,3,6,23], [750,12,6,32]]],
         [[[600,37,6,22], [600,37,6,22], [576,49,6,34]], 
          [[600,37,6,22], [600,37,6,22], [600,37,6,22]]],
         [[[480,1,3,28], [480,1,3,28], [480,1,3,28], [480,1,3,28]],
          [[480,1,3,28], [480,1,3,28], [480,1,3,28], [480,1,3,28]]]]
  com = [[[144,3,0,5,8], [150,0,0,2,8]], [[153,1,0,2,4], [150,2,0,4,4]],
         [[115,5,5,4,4], [120,0,7,2,4]], [[120,0,0,1,7], [120,0,0,1,7]]]
  div = [[[2,4,8,16], [3,5,6,10]], [[4,8,16], [3,6,10]],
         [[4,8,16], [3,6,10]], [[2,4,8,16], [3,5,6,10]]]
  mod = [[4,15], [16,6], [16,6], [4,15]]
  pos = [[141,145], [160,176], [182,198], [204,208]]
  seq = {2=>[14,15,15,14], 3=>[14,15],
         4=>[10,11,12,13], 5=>[10,11,12,13], 6=>[10,11,12,10,11,12],
         8=>[0,1,2,3,4,5,6,7], 10=>[9,0,1,2,3,4,5,6,7,8],
         16=>[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]}
  j = 0
  k = 222
  4.times.each do |a| # DMT ID: 09h,10h,0Ah,06h
    2.times.each do |b| # %16, %15
      n = vid[a][b].size # 3, 4
      n.times.each do |c| # 0-2, 0-3
        next if a == 0 && c == 0
        j = k
        com[a][b].map.reduce(:+).times.each do |d|
          i = case
          when d < com[a][b][0] # common active
            pos[a][b] + (d % mod[a][b])
          when d < com[a][b][0..1].map.reduce(:+) ||
                  (d >= com[a][b][0..2].map.reduce(:+) &&
                   d < com[a][b][0..3].map.reduce(:+))
            a == 3 ? 253 : j += 1
          end
          if i
            l = d * (8-n) # native line
            (8-n).times.each do |e| # line, 0-3, 0-4
              if l < vid[a][b][c][0] # native active
                m = div[a][b][c]
                s = seq[m][l % seq[m].size]
                s |= 0x80 if (l % m) == m - 1
              else
                s = 0x49
              end
              if l >= vid[a][b][c][0..1].map.reduce(:+) &&
                 l < vid[a][b][c][0..2].map.reduce(:+)
                s |= 0x20 if sync[a]
              else
                s |= 0x20 unless sync[a]
              end
              t = rom[(c * (8-n)) + e][i]
              exit if t != 255 && t != s
              rom[(c * (8-n)) + e][i] = s # set S value
              l += 1
            end
          else
            i = sync[a] ? 255 : 254
          end
          rom[(a * 2) + b][d] = i # set $LMOD
        end
      end
      rom[(a * 2) + b][com[a][b].map.reduce(:+) - 1] = 0 # terminate line
      k = j
    end
  end
  # calculate audio, add to ROM here...
  rom.each {|a| a[254,255] = 0x69, 0x49}
  rom.each_with_index do |a, j|
    a.each_slice(16).each_with_index do |b, i|
      print_data [b.size, offset + j, i << 4, 0] + b
    end
  end
end

print_av 0xD0
exit

# start of ALU high
print_ext_addr 0x0002
# 0x00020000-0x00020FFF: MV high nibble
print_binary nil, 0x00, high: true, pass: true
# 0x00021000-0x00021FFF: ADD high nibble
print_binary '+', 0x10,  high: true
# 0x00022000-0x00022FFF: SUB high nibble
print_binary '-', 0x20,  high: true
# 0x00023000-0x00023FFF: AS high nibble

# 0x00024000-0x00024FFF: AND high nibble
print_binary '&', 0x40,  high: true, pass: true
# 0x00026000-0x00025FFF: OR high nibble
print_binary '|', 0x50,  high: true, pass: true
# 0x00027000-0x00026FFF: XOR high nibble
print_binary '^', 0x60,  high: true, pass: true
# 0x00027000-0x00027FFF: DC high nibble


# start of ALU low
print_ext_addr 0x0003
# 0x00030000-0x00030FFF: MV low nibble
print_binary nil, 0x00, pass: true
# 0x00031000-0x00031FFF: ADD low nibble
print_binary '+', 0x10
# 0x00032000-0x00032FFF: SUB low nibble
print_binary '-', 0x20
# 0x00033000-0x00033FFF: AS low nibble

# 0x00034000-0x00034FFF: AND low nibble
print_binary '&', 0x40, pass: true
# 0x00035000-0x00035FFF: OR low nibble
print_binary '|', 0x50, pass: true
# 0x00036000-0x00036FFF: XOR low nibble
print_binary '^', 0x60, pass: true
# 0x00037000-0x00037FFF: DC low nibble

# 0x00038000-0x00038FFF: MUL low nibble only
print_binary '*', 0x80
# 0x00039000-0x00039FFF: DIV low nibble only
print_binary '/', 0x90
# 0x0003A000-0x0003AFFF: FNA low nibble only

# 0x0003B000-0x0003BFFF: FNB low nibble only

# 0x0003C000-0x0003CFFF: VOL low nibble only

# 0x0003D000-0x0003DFFF: AV low nibble only
print_av 0xD0
# 0x0003E000-0x0003EFFF: SER low nibble only

# 0x0003F000-0x0003FFFF: FNF low nibble only
# $INC: A = A + 1
print_unary(0xF0, [*1..0xFF] + [0])
# $DEC: A = A - 1
print_unary(0xF1, [0xFF] + [*0..0xFE])
# $ZERO: A = (A == 0) ? 0 : -1
print_unary(0xFE, [0] + 0xFF.times.map{0xFF})
# $IDEN: A = A
print_unary(0xFF, [*0..0xFF])
