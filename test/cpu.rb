#!/usr/bin/env ruby
  
def load_rom
  filename = 'build/output/rom.hex'
  file = File.open filename
  bank = 0
  rom = []
  file.each do |l|
    case l[7, 2].to_i(16)
    when 4
      bank = l[9, 4].to_i(16)
      rom[bank] ||= Array.new(0x10000, 0xFF)
    when 0
      size = l[1, 2].to_i(16)
      addr = l[3, 4].to_i(16)
      size.times {|i| rom[bank][addr + i] = l[(i * 2) + 9, 2].to_i(16)}
    end
  end
  rom
end

def set_dst(ram, reg, c, z, d)
  i = ((c>>8)&3) | ((c&3)<<2)
  reg[PC] = 0 if DST[i] == :PG
  reg[i] = d
  return unless c&0x400 == 0

  b = c&4 == 0 ? reg[EO]&7 : 0
  x = z ? 0xFF : reg[X]
#puts "WRITE RAM:#{d}->(#{b},#{reg[Y]},#{x})"
  ram[b][reg[Y]][x] = d
end

def get_src(ram, reg, c, z)
  i = (c>>12)&1 | (c>>2)&2
  return reg[16 + i] unless i == 3
  
  b = c&4 == 0 ? reg[EO]&7 : 0
  x = z ? 0xFF : reg[X]
#puts "READ RAM:(#{b},#{reg[Y]},#{x})=#{ram[b][reg[Y]][x]}"
  ram[b][reg[Y]][x]
end

def get_pc(reg)
  pc = (reg[PG]<<8) + reg[PC]
  reg[PC] = reg[PC] + 1
  pc
end

def fetch(rom, reg)
  c = rom[0][get_pc(reg)] << 8
  return c|0xFF unless c&0x8000 == 0

  c | rom[0][get_pc(reg)]
end

def alu_fn(ram, alu, reg, c, z, h = true, a = false)
  fn = (c&0xF0)<<8
  fn |= h ? (reg[HL]&0xF0)<<4 : (reg[HL]&0x0F)<<8
  src = a ? reg[A] : get_src(ram, reg, c, z)&0xFF
  alu[fn | src]
end

DST = %I[N O1 O2 O3 O4 O5 O6 O7 X EO S V Y HL PC PG I EI A D]
puts DST.to_s
N=0; O1=1; O2=2; O3=3
O4=4; O5=5; O6=6; O7=7
X=8; EO=9; S=10; V=11
Y=12; HL=13; PC=14; PG=15
I=16; EI=17; A=18; D=19
# simulate page
reg = Array.new(20, -1)
page = ARGV.first.to_i # execute page
rom = load_rom
ram = Array.new(8) {|a| Array.new(256) {|b| Array.new(256, 0x00)}} # [B][Y][X]
ram[1][0x00][0x00]=0x3E
ram[1][0x00][0x01]=0x0A
ram[1][0x00][0x02]=0xD3
ram[1][0x00][0x03]=0x09
ram[1][0x00][0x04]=0x76
ram[1][0x00][0x05]=0x00
ram[1][0x00][0x06]=0x7B
ram[1][0x00][0x07]=0x95
ram[1][0x00][0x08]=0x7A
ram[1][0x00][0x09]=0x9C
ram[1][0x00][0x0A]=0x76
ram[1][0x00][0x0B]=0xC2
ram[1][0x00][0x0C]=0x04
ram[1][0x00][0x0D]=0x00
ram[1][0x00][0x0E]=0x76
ram[0][0xFA][0xFF]=0xFF    # $PCL
ram[0][0xFB][0xFF]=0xFF    # $PCH
ram[0][0xD6][0xFF]=0xA0    # $VMS
ram[0][0xF8][0xFF]=0x10    # $SPH
ram[0][0xF9][0xFF]=0x00    # $SPL

ram[0][0xB0][0xFF]=0x04
ram[0][0xB1][0xFF]=0x74

ram[0][0xDC][0xFF]=2 # CBLOCK
ram[0][0xDD][0xFF]=0 # CTXIDX
ram[0][0x01][0xFE]=0xF2 # CPU2
ram[0][0x02][0xFE]=0xF1 # CPU2
ram[0][0x03][0xFE]=0xF2 # CPU2
ram[0][0xDE][0xFF]=0xF1 # CTX0

ram[0][0xF0][0xFF]=0x10
ram[0][0xF1][0xFF]=0x11
ram[0][0xF2][0xFF]=0x12
ram[0][0xF3][0xFF]=0x13
ram[0][0xF4][0xFF]=0x14
ram[0][0xF5][0xFF]=0x15
ram[0][0xF6][0xFF]=0x16
ram[0][0xF7][0xFF]=0x17
ram[0][0xF8][0xFF]=0x18
ram[0][0xF9][0xFF]=0x19
ram[0][0xFC][0xFF]=0x1C
ram[0][0xFD][0xFF]=0x1D
ram[0][0xFE][0xFF]=0x1E

reg[EI]=0x00
reg[EO]=0x01
ram[0][0xE0][0xFF]=reg[EO]
reg[PG] = page
reg[PC] = 0
reg[Y] = 0xD6 # $VMS
q = "N/A"
u = "N/A"
v = "N/A"
200000.times do |q|
  s = "N/A"
  t = "N/A"
  n = 0
  z = true
  #puts "PAGE: #{reg[PG].to_s(16)}"
  while true do
    c = fetch(rom, reg)
    case c>>13
    when 0 # ALUHL+A
      reg[A] = alu_fn(ram, rom[3], reg, c, c&0x800 != 0, false)
      set_dst(ram, reg, c, c&0x800 != 0, reg[A])
      reg[A] = alu_fn(ram, rom[2], reg, c, c&0x800 != 0, true, true)
      set_dst(ram, reg, c, c&0x800 != 0, reg[A])
      n += 4
    when 1 # ALUL
      x = alu_fn(ram, rom[3], reg, c, c&0x800 != 0, false)
      set_dst(ram, reg, c, c&0x800 != 0, x)
      n += 3
    when 2 # ALUH+A
      reg[A] = alu_fn(ram, rom[3], reg, c, c&0x800 != 0)
      set_dst(ram, reg, c, c&0x800 != 0, reg[A])
      n += 3
    when 3 # ROMH
      x = alu_fn(ram, rom[1], reg, c, c&0x800 != 0)
      set_dst(ram, reg, c, c&0x800 != 0, x)
      n += 3
    when 4 # NOP, LD
      n += 1
      next if c&0xF000 == 0x8000

      n += 1
      set_dst(ram, reg, c, c&0x800 != 0, rom[0][get_pc(reg)])
    when 5 # LDP, LDN
      n += 1
      if (c>>5)&0x80 == reg[A].to_i&0x80
#puts "COND: true"
        set_dst(ram, reg, c, c&0x800 != 0, rom[0][get_pc(reg)])
        n += 1
      else
#puts "COND: false"
        reg[PC] = reg[PC] + 1
      end
    when 6 # FNH+A
      reg[A] = alu_fn(ram, rom[3], reg, c, z)
      set_dst(ram, reg, c, c&0x800 != 0, reg[A])
      n += 2
    when 7 # FNH
      x = alu_fn(ram, rom[3], reg, c, z)
      set_dst(ram, reg, c, c&0x800 != 0, x)
      n += 2
    end
pc = ram[0][0xFA][0xFF].to_s(16)+ram[0][0xFB][0xFF].to_s(16)
hl = ram[0][0xF6][0xFF].to_s(16)+"|"+ram[0][0xF7][0xFF].to_s(16)
de = ram[0][0xF4][0xFF].to_s(16)+"|"+ram[0][0xF5][0xFF].to_s(16)
stx = ram[1][0x0F][0xFF].to_s(16)+ram[1][0x0F][0xFE].to_s(16)
    puts "[#{n}] [#{ram[0][0xDC][0xFF]},#{ram[0][0xDD][0xFF]},#{ram[0][0xDE][0xFF]},#{ram[0][0xDF][0xFF]},#{ram[0][0xE0][0xFF]},#{ram[0][0xED][0xF1]>=128},#{ram[0][0xD6][0xFF]&8}] PAGE:#{reg[PG].to_s(16)} PC:#{reg[PC]} inst:#{ram[0][0xEC][0xFF].to_s(16)} i8080 PC:#{pc} A:#{ram[0][0xF0][0xFF].to_s(16)} F:#{ram[0][0xF1][0xFF].to_s(16)} DE:#{de} HL:#{hl} [SP]:#{stx} #{c.to_s(16)}"  if c == 0x1F7F
    #puts reg.to_s
    break if c == 0x1F7F # || reg[PC] == 0
    z = c&0x800 != 0
  end
#puts "|###|-->  INST:#{ram[0][0xEC][0xFF].to_s(16)} A:#{ram[0][0xF0][0xFF]} H:#{ram[0][0xF6][0xFF]} L:#{ram[0][0xF7][0xFF]} MEM:#{ram[0][0x21][0x21]}  <--|###|"
#pp (0xA0..0xA7).map {|i| ram[0][i][0xFF].to_s(16)}
#puts "#{ram[0][0xA0][0xFF]>>4},#{(-1*ram[0][0xA5][0xFF])&0xff}"
end
