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

# ALU function: WAV (wavetable sythesizer)
# Gain/Wave - HL, sample index - acc
# L) A = WT[L][A] - wavetable of signed 8-bit samples
# H) A = 32 + (A / 2**(7-H/3)) - attenuate from -12db in 2dB step
def print_wav(offset, opts = {})
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

SYNC_PG = [5, 6, 7, 0, 2, 3, 4, 0, 2, 3, 4, 0, 1, 2, 3, 4].freeze

# ALU function: VMP (Virtual Machine Page/interpreter decode)
# Instruction - HHHHLLLL, virtual machine state (VMS) - MMMMECCC
# L) A = 0000ZFFF - sync: Z=(L==0), FFF=feature [N,dA,A,dT,T,R,dP,P]
# L) A = 1ECCLLLL - exec: E=ext, CC=remaining cycles [1,2,3,>3], LLLL
# H) PG = PPPPPPPP - page number
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

# Verical timing: [active,back,sync,front]
# Process cycles: [active,sync,porch]
# Mode-line number(s): [(start..end)],[...]]
# Process cycles per pattern: [mode0, mode1,...]
# Modulo(s) per mode: [[mode0,...],[mode1,...]
VID = [[[480,10,2,33], [160,4,11], [(0..2)], [4,2,8], [[2], [3], [8]]],        # 838x480@60 (vga60)
       [[480,1,3,28], [120,1,7], [(3..6),(7..10)], [2,5], [[2,8], [4,10]]],    # 670x492@75 (vga75)
       [[480,11,8,13], [120,5,3], [(3..6),(7..10)], [6,5], [[3,8], [2,10]]],   # 820x494@75 (vgarb)
       [[600,1,4,35], [150,2,8], [(3..6),(7..10)], [15,12], [[5,10], [3,16]]], # 660x608@60 (svga60)
       [[600,15,8,17], [150,6,4], [(3..6),(7..10)], [5,12], [[4,10], [3,16]]], # 820x622@60 (svgarb)
       [[768,3,6,23], [153,3,4], [(11..15)], [4,8,16], [[4], [8], [16]]],      # 520x762@60 (xga60)
       [[768,13,8,11], [153,5,2], [(11..15)], [6,16], [[3], [16]]]].freeze     # 648x777@60 (xgarb)
SEQ = {2=>[14,15,15,14], 3=>[14,15], 4=>[10,11,12,13],
       5=>[10,11,12,13,12,11], 6=>[10,11,12,13,12,11],
       8=>[0,1,2,3,4,5,6,7], 10=>[9,0,1,2,3,4,5,6,7,8],
       16=>[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]}.freeze
# ALU function: VID (Video timings)
def print_vid(offset)
  rom = Array.new(16) { Array.new(0x100, 0xFF) }
  a = 0
  x = [176, 129, 161, 161]
  y = Array.new 4, 224
  VID.each do |v|
    u = 0
    u = v[0].map {|t| u+=t}
    v[4].each_with_index do |c, i| # timing columns
      c.each_with_index do |d, j| # timing columns
        p = 0
        t = 0
        z = v[2][j].last/4
        v[1].each_with_index do |b, k| # process cycles
          b.times do
            q = p%v[3][i]
            w = case k
	    when 0
              x[z]+q
            when 1
              y[z]
            when 2
              0xFF
            end
            rom[a][p] = w
            v[2][j].each do |r|
              s = (t>=u[1] && t<u[2]) ? 0 : 0x20 # vsync active low
              if t<u[0]
                s |= SEQ[d][t%SEQ[d].size] # set glyph line
                s |= 0x80 if (t%d)==d-1 # inc V at start of glyph
              else
                s |= 0x49 # hblank active high
              end
              rom[r][w] = s if rom[r][w] == 0xFF
              exit if rom[r][w] != s # conflict!
              t += 1
            end
            p += 1
            y[z] += 1 if k==1
          end
        end
        rom[a][p] = 0
        x[z] += v[3][i]
      end
      a += 1
    end
  end
  # dump ROM table
  rom.each_with_index { |a, j|
    a.each_slice(16).each_with_index { |b, i|
      print_data [b.size, offset + j, i << 4, 0] + b
    }
  }
end

# ALU function: COM (Comms State Machine)
# Next comms state = E [ps2clk,ps2rx,cts,rx], comms state SDSSPDPS
# Serial Data: SD0=rx, SD1=rx if SS==1 (sample when SS goes 1->2)
# Serial State: SS=(SS+1)%4, SS=0 if SD0!=rx
# @start: PS=ps2clk
# PS/2 Data: (PD1=PD0, PD0=ps2rx) if (PS0==1 && ps2clk==0)
# PS/2 State: PS=(PS+1)%4 if PS0!=ps2clk
# @end: #bits = {1:0,2:1,3:1,0:2}[PS]
def print_com(offset)
  16.times.map do |a| # E
    ps2clk = a>>3
    ps2rx = (a>>2)&1
    rx = a&1
    16.times.map do |b| # serial
      sd = b>>2
      ss = b&3
      d = 16.times.map do |c| # ps/2
        pd = c>>2
        ps = c&3
        [(ss==1 ? rx : sd>>1)*2 + rx,
         (sd&1)==rx ? (ss+1)%4 : 0,
         ((ps&1)==1 && ps2clk==0) ? ((pd*2)&3)+ps2rx : pd,
         (ps&1)==ps2clk ? ps : (ps+1)%4
        ].join.to_i(4)
      end
      print_data([d.size, offset + a, b << 4, 0] + d)
    end
  end
end

NEXT_LINE = [0x10, 0x20, 0x00,
       0x40, 0x50, 0x60, 0x30,
       0x80, 0x90, 0xA0, 0x70,
 0xC0, 0xD0, 0xE0, 0xF0, 0xB0].freeze

# Increment line count in HAL state machine
def inc_line
  256.times.map {|i| (i&8) | NEXT_LINE[i>>4]}
end

# fork on HAL feature
def fork_feature
  2.times.map do |i|
    4.times.map do |j|
      case i
      when 0 # async
        [0x60, 0x60, 0x70, 0xA8] * 8
      when 1 # rsync
        [0x20, 0x30, 0x50, 0x50, 0x80, 0x80, 0x80, 0x80,
         0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 
         0x80, 0x80, 0x80, 0x80, 0xA0, 0xA0, 0x20, 0x20,
         0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20]
      when 2 # tsync
        [0x20, 0xE0, 0x30, 0xE0, 0x70, 0x70, 0x70, 0x70,
         0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 
         0x70, 0x70, 0x70, 0x70, 0xB0, 0xB0, 0x20, 0x20,
         0xF0, 0x28, 0xF0, 0x28, 0x20, 0x20, 0x20, 0x20]
      when 3 # kscan
        [0x08, 0x08, 0x08, 0x08, 0x58, 0x58, 0x58, 0x58,
         0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x80, 0x80, 
         0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
         0x80, 0x80, 0xA8, 0xA8, 0x08, 0x08, 0x08, 0x08]
      end
    end
  end.flatten
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
# 0x00026000-0x00026FFF: WAV high nibble
print_wav 0x60, high: true
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
# 0x00036000-0x00036FFF: WAV low nibble
print_wav 0x60
# 0x00037000-0x00037FFF: VMP low nibble
print_vmp 0x70, high: false

# 0x00038000-0x00038FFF: MUL low nibble only
print_binary '*', 0x80
# 0x00039000-0x00039FFF: DIV low nibble only
print_binary '/', 0x90
# 0x0003A000-0x0003AFFF: COM low nibble only
print_com 0xA0
# 0x0003B000-0x0003BFFF: VID low nibble only
print_vid 0xB0

# 0x0003C000-0x0003CFFF: FNC low nibble only - TBD
# $V2E: calculate E-reg GPU mode bits from video mode  **** MOVE ****
print_unary(0xC0, 256.times.map {|i|
  e = i&1 == 0 ? 0 : 0x10
#  e |= i&2 == 0 ? 0 : 0x40 # rev 3 board
  e |= i&2 == 0 ? 0 : 0x20 # rev 4 board
#  i&0x60 == 0x60 ? e : e|0x20 # rev 3 board
  i&0x60 == 0x60 ? e : e|0x40 # rev 4 board
})
# $V2M: calculate mode_line from video mode  **** MOVE ****
print_unary(0xC1, 256.times.map {|i|
  m = (i<<2)&0x30
  i&0x40 == 0 ? m*4 : (m*5)|4
})

# 0x0003D000-0x0003DFFF: FND low nibble only - 8080 vCPU related
# FORKI: {0000:0x28, 0001:0x50, 001x:0x78, 01xx:0xA0, 1xxx:0xC8}
print_unary(0xD0, fork_intr)
# $MAPREGH: map instruction to zpage addr of destination register, or high source register pair
REG8=[0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7, 0xE0, 0xE1].freeze
REG16H=[0xE2, 0xE4, 0xE6, 0xE8].freeze
print_unary(0xD1, 256.times.map { |i|
  j = i & 0xC7
  (j > 0 && j < 4) ? REG16H[(i&0x30)>>4] : REG8[(i&0x38)>>3]
})
# $MAPREGL: map instruction to zpage addr of source register, or low source register pair
REG16L=[0xE3, 0xE5, 0xE7, 0xE9].freeze
print_unary(0xD2, 256.times.map { |i|
  j = i & 0xC7
  (j > 0 && j < 4) ? REG16L[(i&0x30)>>4] : REG8[i&7]
})
# $F2PSW: flags->PSW
print_unary(0xD3, flags_psw)
# $PSW2F: PSW->flags
print_unary(0xD4, psw_flags)
# $SWCARRY: swap carry with borrow flags (CNZPHOBL->BNZPLOCH)
print_unary(0xD5, swap_carry)
# $DACARRY: set carry if nibbles > 9
print_unary(0xD6, da_carry)
# $CON2MUL: condition code to flag multiplier (ZCPS->CNZPHOBL)
CON=[4, 1, 8, 2].freeze
UNC=[0xC3, 0xC9, 0xCD].freeze # unconditional instructions
print_unary(0xD7, 256.times.map {|i| UNC.include?(i) ? 0 : CON[(i&0x30)>>4]})
# $RSTVEC



# 0x0003E000-0x0003EFFF: FNE low nibble only - HAL related
# $INCCYC: inc, clear ext bit
print_unary(0xE0, 256.times.map{|i| (i+1)&0xF7})
# $FORK1: 0->0x80,else->0xC0
print_unary(0xE1, [0x80] + Array.new(0xFF, 0xC0))
# $FORK2: 0xFF->0x40,0->0x80,else->0xC0
print_unary(0xE2, [0x80] + Array.new(0xFE, 0xC0) + [0x40])
# $FORK3: 0xFE->0x20,0xFF->0x38,0->0x90,else->0xC8
print_unary(0xE3, [0x90] + Array.new(0xFD, 0xC8) + [0x20, 0x38])
# $FORKF: fork on HAL feature
print_unary(0xE4, fork_feature)
# $KS01?: &3==0||1 ? 0:-1
print_unary(0xE5, 256.times.map{|i| i&3 <= 1 ? 0 : 0xFF})
# $KDATA: &C>>2
print_unary(0xE6, 256.times.map{|i| (i&0xC) >> 2})
# $ML2FC: mode-line to frame count: 3-6->-5,else->4
print_unary(0xE7, [0xFC]*48 + [0xFB]*64 + [0xFC]*144)
# $XGA?: mode-line: 0-10->-1,else->0
print_unary(0xE8, [0xFF]*176 + [0]*80)
# $RSADJ: serial state -1
print_unary(0xE9, 256.times.map{|i| (i&0x30).zero? ? i|0x30 : i-0x10})


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
# $LSR: >>1
print_unary(0xF6, 256.times.map{|i| i>>1})
# $NSR: >>1&0x80
print_unary(0xF7, 256.times.map{|i| (i>>1) | 0x80})
# $OVER?: A = A==0? 0 : -1
print_unary(0xF8, [0] + Array.new(0xFF, 0xFF))
# $UNDER?: A = A==0xFF? -1 : 0
print_unary(0xF9, Array.new(0xFF, 0) + [0xFF])
# $INCLINE: mode_line+1, cycle = 0
print_unary(0xFA, inc_line)
# $INCPROC: mode_line+1, cycle = 1
print_unary(0xFB, inc_line.map{|i| i+1})

# $SWAP: AB = BA
print_unary(0xFE, 256.times.map {|i| ((i>>4)|(i<<4))&0xFF})
# $REVERSE: 76543210 = 01234567
print_unary(0xFF, 256.times.map {|i| (sprintf "%08b", i)}.map {|i| i.reverse.to_i(2)})
