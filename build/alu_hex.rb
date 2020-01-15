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
  rom = Array.new(16) { Array.new(256, 0xFF) }
  len = [113, 128, 160, 129] # DMT ID: 02h,06h,09h,0Eh
  bpl = [101, 121, 152, 124]
  vsync = [true,false,true,true]
  mod = [[2, 4, 8, 16], [3, 5, 6, 10]]
  seq = [[[14,15,15,14], [8,8,8,8], [0,1,2,3,4,5,6,7],
          [16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]],
          [[14,15,14,15,14,15], [8,8,8,8,8],
          [0,10,11,12,13,7], [0,1,2,3,4,5,6,7,8,9]]]
  vid = [[[[400,1,3,48], [400,1,3,48], [400,1,3,48], [400,1,3,48]],
          [[396,3,3,50], [400,1,3,48], [396,3,3,50], [400,1,3,48]]],
         [[[480,1,3,28], [480,1,3,28], [480,1,3,28], [480,1,3,28]],
          [[480,1,3,28], [480,1,3,28], [480,1,3,28], [480,1,3,28]]],
         [[[512,45,4,79], [600,1,4,35], [600,1,4,35], [592,5,4,39]],
          [[600,1,4,35], [600,1,4,35], [600,1,4,35], [600,1,4,35]]],
         [[[480,6,8,22], [480,6,8,22], [480,6,8,22], [480,6,8,22]],
          [[480,6,8,22], [480,6,8,22], [480,6,8,22], [480,6,8,22]]]]
  com = [[[400,1,3,48], [396,3,3,50]], [[480,1,3,28], [480,1,3,28]],
         [[512,45,4,79], [600,1,4,35]], [[480,6,8,22], [480,6,8,22]]]
  j = 0
  k = 200
  4.times.each do |a| # DMT ID: 02h, 06h, 09h, 0Eh
    2.times.each do |b|
      4.times.each do |c|
        j = k
        len[a].times.each do |d|
          l = d * 4 # native line
          if l < com[a][b][0] # active common
            i = 162 + (d % [4,15][b]) # 0-3,0-14
            i += 4 if b > 0 # skip mod4
            i += 20 if vsync[a] # skip neg sync times
          else
            i = d > bpl[a] ? 250 + a : j += 1
          end
          4.times.each do |e|
            if l < vid[a][b][c][0] # active specific
              s = seq[b][c][l % seq[b][c].size]
              s |= 0x80 if (l % mod[b][c]) == mod[b][c] - 1
            else
              s = 0x48
            end
            if l >= vid[a][b][c][0..1].map.reduce(:+) &&
               l < vid[a][b][c][0..2].map.reduce(:+)
              s |= 0x20 if vsync[a]
            else
              s |= 0x20 unless vsync[a]
            end
            rom[(a * 2) + b][d] = i # set $LMOD
            rom[(c * 4) + e][i] = s # set S value
            l += 1
          end
        end
      end
      rom[(a * 2) + b][len[a]] = 0 # terminate line
      k = j
    end
  end
  # calculate audio, add to ROM here...
  rom.each_with_index do |a, j|
    a.each_slice(16).each_with_index do |b, i|
      print_data [b.size, offset + j, i << 4, 0] + b
    end
  end
end

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
