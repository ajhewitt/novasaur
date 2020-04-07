#!/usr/bin/env ruby

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

# ALU function: AS (arithmetic status)
# HHHHLLLL - HL, BBBBAAAA - acc
# L) BBBBHZHZ - half-carry/zero on A-L/A+L (B-H-C/B+H+C)
# H) CHNZCHNZ - carry/half-carry/negative/zero on BA-HL/BA+HL
#   (sub)(add)
def print_as(offset, opts = {})
  # feature not implemented 
end

# ALU function: VMC (VCPU Decode)
# Instruction - HL, virtual machine state (VMS) MMMMEXCC - acc
# L) ESSSLLLL - state/ext/L|N, SSS:0=decode/L, 1=hsync/next:0=line, 1=vpc
# H) PPPPPPPP - page number
def print_vmp(offset, opts = {})
  16.times.map do |a|
    16.times.map do |b| # b = mode_line/ESSS
      if opts[:high]
        d = case b&7
        when 0 # decode
          Array.new 16, 100
        when 1 # hsync - lsync,psync
          [1, 2, 0, 0, 0, 0, 0, 0] * 2
        else # future stuff
          Array.new 16, 100
        end
      else
        d = 16.times.map do |c| # c = EXCC
          if opts[:ext] #decode always on ext - preserve L
            a
          else
            case c&7
            when 4 #sync on 4 line modes
              b%4 == 2 ? 0x11 : 0x10 #add one for last line
            when 7 #sync on 5 line modes
              b%5 == 3 ? 0x11 : 0x10 #add one for last line
            else
              a #decode - preserve L
            end
          end | (c&8)<<4 #move ext bit to MSB
        end
      end
      print_data([d.size, offset + a, b << 4, 0] + d)
    end
  end
end

def print_av(offset)
  rom = Array.new(16) { Array.new(255, 0xFF) }
  vid = [[[[480,1,3,28], [480,1,3,28], [480,1,3,28], [480,1,3,28]],
          [[480,1,3,28], [480,1,3,28], [480,1,3,28], [480,1,3,28]]],
         [[[512,45,4,79], [600,1,4,35], [600,1,4,35], [576,13,4,47]],
          [[600,1,4,35], [600,1,4,35], [600,1,4,35], [600,1,4,35]]],
         [[[768,3,6,23], [768,3,6,23], [768,3,6,23]],
          [[768,3,6,23], [768,3,6,23], [750,12,6,32]]],
         [[[768,13,8,11], [768,13,8,11], [768,13,8,11]],
          [[768,13,8,11], [768,13,8,11], [750,22,8,20]]]]
  com = [[[120,1,7], [120,1,7]], [[128,24,8], [150,2,8]],
         [[153,3,4], [150,6,4]], [[153,5,2], [150,8,2]]]
  div = [[[2,4,8,16], [3,5,6,10]], [[2,4,8,16], [3,5,6,10]],
         [[4,8,16], [3,6,10]], [[4,8,16], [3,6,10]]]
  mod = [[4,15], [16,6]]
  pos = [[160,164], [179,195]]
  seq = {2=>[14,15,15,14], 3=>[14,15], 4=>[10,11,12,13],
         5=>[10,11,12,13,12,11], 6=>[10,11,12,13,12,11],
         8=>[0,1,2,3,4,5,6,7], 10=>[9,0,1,2,3,4,5,6,7,8],
         16=>[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]}
  j = 0
  k = 200
  4.times.each do |a| # DMT ID: 06h,09h,10h,56h?
    2.times.each do |b| # %16, %15
      n = vid[a][b].size # 3, 4
      n.times.each do |c| # 0-2, 0-3
        j = k
        com[a][b].map.reduce(:+).times.each do |d|
          i = case
          when d < com[a][b][0] # common active
            pos[a>>1][b] + (d % mod[a>>1][b])
          when d < com[a][b][0..1].map.reduce(:+)
            j += 1
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
              if l < vid[a][b][c][0..1].map.reduce(:+) ||
                 l >= vid[a][b][c][0..2].map.reduce(:+)
                s |= 0x20
              end
              t = rom[(c * (8-n)) + e][i]
              exit if t != 255 && t != s
              rom[(c * (8-n)) + e][i] = s # set S value
              l += 1
            end
          else
            i = 255
          end
          rom[(a * 2) + b][d] = i # set $LMOD
        end
      end
      rom[(a * 2) + b][com[a][b].map.reduce(:+) - 1] = 0 # terminate line
      k = j
    end
  end
  # calculate audio, add to ROM here...
  rom.each {|a| a[255] = 0x69}
  rom.each_with_index do |a, j|
    a.each_slice(16).each_with_index do |b, i|
      print_data [b.size, offset + j, i << 4, 0] + b
    end
  end
end

def print_att(offset)
  16.times.map do |a|
    16.times.map do |b|
      d = 16.times.map do |c|
        x = (b << 4) + c
        y = a/-2
        (x * 2**y).to_i
      end
      print_data([d.size, offset + a, b << 4, 0] + d)
    end
  end
end

def inc_line
  256.times.map do |i|
    i &= i&7 > 4 ? 0xFC : 0xF8
    n = i&4 == 0 ? 0x30 : 0x40
    (i&0xF0) % (n+0x10) == n ? i-n : (i+0x10)&0xFF
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
# 0x00023000-0x00023FFF: AND high nibble
print_binary '&', 0x30,  high: true, pass: true
# 0x00024000-0x00024FFF: OR high nibble
print_binary '|', 0x40,  high: true, pass: true
# 0x00025000-0x00025FFF: XOR high nibble
print_binary '^', 0x50,  high: true, pass: true
# 0x00026000-0x00026FFF: VMP high nibble
print_vmp 0x60, high: true, ext: false
# 0x00027000-0x00027FFF: VMQ high nibble
print_vmp 0x70, high: true, ext: true

# start of ALU low
print_ext_addr 0x0003
# 0x00030000-0x00030FFF: MV low nibble
print_binary nil, 0x00, pass: true
# 0x00031000-0x00031FFF: ADD low nibble
print_binary '+', 0x10
# 0x00032000-0x00032FFF: SUB low nibble
print_binary '-', 0x20
# 0x00033000-0x00033FFF: AND low nibble
print_binary '&', 0x30, pass: true
# 0x00034000-0x00034FFF: OR low nibble
print_binary '|', 0x40, pass: true
# 0x00035000-0x00035FFF: XOR low nibble
print_binary '^', 0x50, pass: true
# 0x00036000-0x00036FFF: VMP low nibble
print_vmp 0x60, high: false, ext: false
# 0x00037000-0x00037FFF: VMQ low nibble
print_vmp 0x70, high: false, ext: true

# 0x00038000-0x00038FFF: MUL low nibble only
print_binary '*', 0x80
# 0x00039000-0x00039FFF: DIV low nibble only
print_binary '/', 0x90
# 0x0003A000-0x0003AFFF: COM low nibble only

# 0x0003B000-0x0003BFFF: SER low nibble only

# 0x0003C000-0x0003CFFF: AV low nibble only
print_av 0xC0
# 0x0003D000-0x0003DFFF: ATT low nibble only
print_att 0xD0

# 0x0003E000-0x0003EFFF: FNE low nibble only
# $V2E: calculate E-reg GPU mode bits from video mode
print_unary(0xE0, 256.times.map {|i|
  e = i&1 == 0 ? 0 : 0x10
#  e |= i&2 == 0 ? 0 : 0x40 # rev 3 board
  e |= i&2 == 0 ? 0 : 0x20 # rev 4 board
#  i&0x60 == 0x60 ? e : e|0x20 # rev 3 board
  i&0x60 == 0x60 ? e : e|0x40 # rev 4 board
})
# $V2M: calculate mode_line from video mode
print_unary(0xE1, 256.times.map {|i|
  m = (i<<2)&0x30
  i&0x40 == 0 ? m*4 : (m*5)|4
})
# $FORK
print_unary(0xE2, [0x80] + Array.new(0xFE, 0xC0) + [0x40])
# $UNDER?: A = (A == 0xFF) ? 0 : -1
print_unary(0xEE, Array.new(0xFF, 0xFF) + [0])

# 0x0003F000-0x0003FFFF: FNF low nibble only
# $IDEN: A = A
print_unary(0xF0, [*0..0xFF])
# $INC: A = A + 1
print_unary(0xF1, [*1..0xFF] + [0])
# $DEC: A = A - 1
print_unary(0xF2, [0xFF] + [*0..0xFE])
# $INC2: A = A + 2
print_unary(0xF3, [*2..0xFF] + [0,1])
# $1COM: A = -A + 1
print_unary(0xF4, 256.times.map{|i| ((-1*i)-1)&0xFF})
# $2COM: A = -A
print_unary(0xF5, 256.times.map{|i| (-1*i)&0xFF})
# $ROR
print_unary(0xF6, 256.times.map{|i| ((i>>1)|(i<<7))&0xFF})
# $ROL
print_unary(0xF7, 256.times.map{|i| ((i<<1)|(i>>7))&0xFF})
# $LSR
print_unary(0xF8, 256.times.map{|i| i>>1})
# $LSL
print_unary(0xF9, 256.times.map{|i| (i<<1)&0xFF})
# $ASR
print_unary(0xFA, 256.times.map{|i| (i>>1)|(i&0x80)})
# $SWAP: AB = BA
print_unary(0xFB, 256.times.map {|i| ((i>>4)|(i<<4))&0xFF})
# $INCLINE: (mode_line + 1) % 4|5, cycle = 0
print_unary(0xFC, inc_line)
# $INCPROC: (mode_line + 1) % 4|5, cycle = 1
print_unary(0xFD, inc_line.map{|i| i+1})
# $OVER?: A = (A == 0) ? 0 : -1
print_unary(0xFE, [0] + Array.new(0xFF, 0xFF))
# $FLIP: A76543210 = A01234567
print_unary(0xFF, 256.times.map {|i| (sprintf "%08b", i)}.map {|i| i.reverse.to_i(2)})
