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

# ALU function: AF (arithmetic flags)
# XXXXYYYY = BBBBAAAA + HHHHLLLL
# (BBBBAAAA = XXXXYYYY - HHHHLLLL)
# L) XXXXHZPL = XXXXYYYY $ LLLL (flags for AAAA +/- LLLL)
# H) CSZPHVBL = XXXXHZPL $ HHHH
def print_af(offset, opts = {})
  16.times.map do |a|
    16.times.map do |b|
      d = 16.times.map do |c|
        if opts[:high]
          r = c & 9                                   # preserve half carry/borrow
          r |= 0x80 if b < a                          # C - Carry (from bit 7)
          r |= b >> 3                                 # S - Sign of result
          r |= 0x20 if c&4 != 0 && b == 0             # Z - Zero (high if result is 0)
          r |= ((sprintf('%b', b).split('').map(&:to_i).reduce(&:+) + ((c&2)>>1))%2) << 4
          r |= 4 if ((b&7) < (a&7)) ^ (b < a)         # V - Overflow (carry from bit 6 xor carry)
          r |= 2 unless b < a || (c&4 != 0 && a == 0) # B - Borrow (from bit 7 if subtraction)
        else
          r = b << 4                                  # preserve high nibble
          r |= 8 if c < a                             # H - Half carry (carry from bit 3)
          r |= 4 if c == 0                            # (half zero)
          r |= (sprintf('%b', c).split('').map(&:to_i).reduce(&:+)%2) << 1
          r |= 1 unless c < a || a == 0               # L - Low borrow (from bit 3 if subtraction)
        end
        r
      end
      print_data([d.size, offset + a, b << 4, 0] + d)
    end
  end
end

# ALU function: WTS (wavetable sythesizer)
# Gain/Wave - HL, sample index - acc
# L) A = WT[L][A] - wavetable of signed 8-bit samples
# H) A = 32 + (A / 2**(7-H/3)) - attenuate from -12db in 2dB step
def print_wts(offset, opts = {})
  16.times.map do |a|
    if opts[:high]
      m = 2**(7-a/3)
      n = 256.times.map {|i| i&0x80 == 0 ? i : i-0x100}
      n.map {|i| a.zero? ? 32 : (32 + i/m).round}
    else
      # just generate harmonics from 1 to 16
      h = 128.0 / (a+1)
      256.times.map {|i| (Math.sin(i * Math::PI/h)*127.5).floor&0xff}
    end.each_slice(16).each_with_index {|d, b| print_data [d.size, offset + a, b << 4, 0] + d}
  end
end

# ALU function: VMP (Virtual Machine Page/vCPU decode)
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
          case c&7
          when 4 #sync on 4 line modes
            b%4 == 2 ? 0x11 : 0x10 #add one for last line
          when 7 #sync on 5 line modes
            b%5 == 3 ? 0x11 : 0x10 #add one for last line
          else
            a #decode - preserve L
          end | (c&8)<<4 #move ext bit to MSB
        end
      end
      print_data([d.size, offset + a, b << 4, 0] + d)
    end
  end
end

# ALU function: AVT (Audio/Video timings)
def print_avt(offset)
  # Video timing
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
  # Audio timing
  640.times.map { |i|
    f = 440 * 2.0**((i-(4*69))/48.0) # middle A (440Hz) MIDI #69 48-EDO
    n = 0x10000 * f / (412500 / 43) % 0xffff
    [n.round >> 8, n.round & 0xff]
  }.flatten.each_slice(8).each_with_index { |a, j|
    a.each_with_index {|n, i| rom[i+8][j] = n}
  }
  # dump ROM table
  rom.each {|a| a[255] = 0x69}
  rom.each_with_index { |a, j|
    a.each_slice(16).each_with_index { |b, i|
      print_data [b.size, offset + j, i << 4, 0] + b
    }
  }
end

# Increment line count in HAL state machine
def inc_line
  256.times.map do |i|
    i &= i&7 > 4 ? 0xFC : 0xF8
    n = i&4 == 0 ? 0x30 : 0x40
    (i&0xF0) % (n+0x10) == n ? i-n : (i+0x10)&0xFF
  end
end

# fork on masked interupt
def fork_intr
  256.times.map do |i|
    case 
    when i & 0x04 != 0 # rst 7.5
      0xD8
    when i & 0x02 != 0 # rst 6.5
      0xC0
    when i & 0x01 != 0 # rst 5.5
      0xA8
    when i & 0x80 != 0 # rst 4.5
      0x90
    when i & 0x40 != 0 # rst 3.5
      0x78
    when i & 0x20 != 0 # rst 2.5
      0x60
    when i & 0x10 != 0 # rst 1.5
      0x48
    when i & 0x08 != 0 # intr
      0x30
    else               # fetch
      0x18
    end
  end
end

# Swap carry with borrow flags (CSZPHVBL->BSZPLVCH)
def swap_carry
  256.times.map do |i|
    r = i & 0x74
    r |= (i&2)<<6
    r |= (i&1)<<3
    r |= (i&0x80)>>6
    r |= (i&8)>>3
    r
  end
end

# Decimal adjust carry (set carry if nibbles > 9)
def da_carry
  256.times.map do |i|
    r = i
    r |= 8 if i&0xF > 9
    r |= 0x80 if i&0xF0 > 0x90
    r
  end
end

# Flags -> PSW (CSZPHVBL->SZKA0PVC)
def flags_psw
  256.times.map do |i|
   r = 0
   r |= 0x80 unless i&0x40 == 0
   r |= 0x40 unless i&0x20 == 0
   r |= 0x20 if (i&0x40 == 0) ^ (i&0x04 == 0) # undocumented 8085
   r |= 0x10 unless i&8 == 0
   r |= 4 unless i&0x10 == 0
   r |= 2 unless i&0x04 == 0 # undocumented 8085
   r |= 1 unless i&0x80 == 0
   r
  end
end

# PSW -> Flags (SZKA0PVC->CSZPHV00)
def psw_flags
  256.times.map do |i|
   r = 0
   r |= 0x80 unless i&1 == 0
   r |= 0x40 unless i&0x80 == 0
   r |= 0x20 unless i&0x40 == 0
   r |= 0x10 unless i&4 == 0
   r |= 8 unless i&0x10 == 0
   r |= 4 unless i&0x02 == 0 # undocumented 8085
   r
  end
end

# start of ALU high
print_ext_addr 0x0002
# 0x00020000-0x00020FFF: MV high nibble
print_binary nil, 0x00, high: true, pass: true
# 0x00021000-0x00021FFF: ADD high nibble
print_binary '+', 0x10,  high: true
# 0x00022000-0x00022FFF: AF high nibble
print_af 0x20,  high: true
# 0x00023000-0x00023FFF: AND high nibble
print_binary '&', 0x30,  high: true, pass: true
# 0x00024000-0x00024FFF: OR high nibble
print_binary '|', 0x40,  high: true, pass: true
# 0x00025000-0x00025FFF: XOR high nibble
print_binary '^', 0x50,  high: true, pass: true
# 0x00026000-0x00026FFF: WTS high nibble
print_wts 0x60, high: true
# 0x00027000-0x00027FFF: VMP high nibble
print_vmp 0x70, high: true

# start of ALU low
print_ext_addr 0x0003
# 0x00030000-0x00030FFF: MV low nibble
print_binary nil, 0x00, pass: true
# 0x00031000-0x00031FFF: ADD low nibble
print_binary '+', 0x10
# 0x00032000-0x00032FFF: AF low nibble
print_af 0x20
# 0x00033000-0x00033FFF: AND low nibble
print_binary '&', 0x30, pass: true
# 0x00034000-0x00034FFF: OR low nibble
print_binary '|', 0x40, pass: true
# 0x00035000-0x00035FFF: XOR low nibble
print_binary '^', 0x50, pass: true
# 0x00036000-0x00036FFF: WTS low nibble
print_wts 0x60
# 0x00037000-0x00037FFF: VMP low nibble
print_vmp 0x70, high: false

# 0x00038000-0x00038FFF: MUL low nibble only
print_binary '*', 0x80
# 0x00039000-0x00039FFF: DIV low nibble only
print_binary '/', 0x90
# 0x0003A000-0x0003AFFF: SER low nibble only - TBD

# 0x0003B000-0x0003BFFF: AVT low nibble only
print_avt 0xB0

# 0x0003C000-0x0003CFFF: FNC low nibble only - TBD
# TBD

# 0x0003D000-0x0003DFFF: FND low nibble only - 8080 vCPU related
# $VMP1:

# VMP2:

# FORKI: {0000:0x28, 0001:0x50, 001x:0x78, 01xx:0xA0, 1xxx:0xC8}
print_unary(0xD2, fork_intr)


# $MAPREGH: map instruction to zpage addr of destination register, or high source register pair
REG8=[0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7, 0xE0, 0xE1].freeze
REG16H=[0xE2, 0xE4, 0xE6, 0xE8].freeze
print_unary(0xD4, 256.times.map { |i|
  j = i & 0xC7
  (j > 0 && j < 4) ? REG16H[(i&0x30)>>4] : REG8[(i&0x38)>>3]
})
# $MAPREGL: map instruction to zpage addr of source register, or low source register pair
REG16L=[0xE3, 0xE5, 0xE7, 0xE9].freeze
print_unary(0xD5, 256.times.map { |i|
  j = i & 0xC7
  (j > 0 && j < 4) ? REG16L[(i&0x30)>>4] : REG8[i&7]
})
# $F2PSW: flags->PSW
print_unary(0xD6, flags_psw)
# $PSW2F: PSW->flags
print_unary(0xD7, psw_flags)
# $SWCARRY: swap carry with borrow flags (CNZPHOBL->BNZPLOCH)
print_unary(0xD8, swap_carry)
# $DACARRY: set carry if nibbles > 9
print_unary(0xD9, da_carry)
# $CON2MUL: condition code to flag multiplier (ZCPS->CNZPHOBL)
CON=[4, 1, 8, 2].freeze
UNC=[0xC3, 0xC9, 0xCD].freeze # unconditional instructions
print_unary(0xDA, 256.times.map {|i| UNC.include?(i) ? 0 : CON[(i&0x30)>>4]})
# $RSTVEC:










# 0x0003E000-0x0003EFFF: FNE low nibble only - HAL related


# $INCCYC: inc, clear ext bit
print_unary(0xE1, 256.times.map{|i| (i+1)&0xF7})
# $FORKS: fork on serial mode

# $FORKA: fork on audio mode {1:0x60, 2:0x70, 3:0xA8}
print_unary(0xE1, [0x60, 0x60, 0x70, 0xA8] * 64)
# $FORK1: 0->0x80,else->0xC0
print_unary(0xE4, [0x80] + Array.new(0xFF, 0xC0))
# $FORK2: 0xFF->0x40,0->0x80,else->0xC0
print_unary(0xE5, [0x80] + Array.new(0xFE, 0xC0) + [0x40])
# $FORK3: 0xFE->0x20,0xFF->0x38,0->0x90,else->0xC8
print_unary(0xE6, [0x90] + Array.new(0xFD, 0xC8) + [0x20, 0x38])


# $V2E: calculate E-reg GPU mode bits from video mode  **** MOVE ****
print_unary(0xE8, 256.times.map {|i|
  e = i&1 == 0 ? 0 : 0x10
#  e |= i&2 == 0 ? 0 : 0x40 # rev 3 board
  e |= i&2 == 0 ? 0 : 0x20 # rev 4 board
#  i&0x60 == 0x60 ? e : e|0x20 # rev 3 board
  i&0x60 == 0x60 ? e : e|0x40 # rev 4 board
})
# $V2M: calculate mode_line from video mode  **** MOVE ****
print_unary(0xE9, 256.times.map {|i|
  m = (i<<2)&0x30
  i&0x40 == 0 ? m*4 : (m*5)|4
})

# 0x0003F000-0x0003FFFF: FNF low nibble only - generic/default functions
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
# $LSR
print_unary(0xF6, 256.times.map{|i| i>>1})
# $LSL
print_unary(0xF7, 256.times.map{|i| (i<<1)&0xFF})
# $ASR
print_unary(0xF8, 256.times.map{|i| (i>>1)|(i&0x80)})


# $OVER?: A = (A == 0) ? 0 : -1
print_unary(0xFA, [0] + Array.new(0xFF, 0xFF))
# $UNDER?: A = (A == 0xFF) ? -1 : 0
print_unary(0xFB, Array.new(0xFF, 0) + [0xFF])
# $INCLINE: (mode_line + 1) % 4|5, cycle = 0
print_unary(0xFC, inc_line)
# $INCPROC: $INCLINE + 1 (cycle = 1)
print_unary(0xFD, inc_line.map{|i| i+1})
# $SWAP: AB = BA
print_unary(0xFE, 256.times.map {|i| ((i>>4)|(i<<4))&0xFF})
# $REVERSE: A76543210 = A01234567
print_unary(0xFF, 256.times.map {|i| (sprintf "%08b", i)}.map {|i| i.reverse.to_i(2)})
