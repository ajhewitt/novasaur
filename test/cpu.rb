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
      rom[bank] ||= []
    when 0
      size = l[1, 2].to_i(16)
      addr = l[3, 4].to_i(16)
      size.times {|i| rom[bank][addr + i] = l[(i * 2) + 9, 2].to_i(16)}
    end
  end
  rom
end

def set_dst(ram, reg, c, d)
  i = ((c>>8)&3) | ((c&3)<<2)
  reg[PC] = 0 if DST[i] == :PG
  reg[i] = d
  return unless c&0x400 == 0

  b = c&4 == 0 ? (reg[EO]>>5)&7 : 0
  x = c&0x800 == 0 ? reg[X] : 0xFF
puts "WRITE RAM:#{d}->(#{b},#{reg[Y]},#{x})"
  ram[b][reg[Y]][x] = d
end

def get_src(ram, reg, c)
  i = (c>>12)&1 | (c>>2)&2
  return reg[16 + i] unless i == 3
  
  b = c&4 == 0 ? (reg[EO]>>5)&7 : 0
  x = c&0x800 == 0 ? reg[X] : 0xFF
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

def alu_fn(ram, alu, reg, c, h = true, a = false)
  fn = (c&0xF0)<<8
  fn |= h ? (reg[HL]&0xF0)<<4 : (reg[HL]&0x0F)<<8
  src = a ? reg[A] : get_src(ram, reg, c)&0xFF
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
ram[0][0x00][0x00]=0x21
ram[0][0x00][0x01]=0x21
ram[0][0x00][0x02]=0x21
ram[0][0x00][0x03]=0x77
ram[0][0x00][0x04]=0x24
ram[0][0x00][0x05]=0xC2
ram[0][0x00][0x06]=0x03
ram[0][0x00][0x07]=0x00
ram[0][0x00][0x08]=0x3C
ram[0][0x00][0x09]=0xC3
ram[0][0x00][0x0A]=0x03
ram[0][0x00][0x0B]=0x00
ram[0][0xF0][0xFF]=0xDD
ram[0][0xFA][0xFF]=0x00    # $PCL
ram[0][0xFB][0xFF]=0x00    # $PCH
ram[0][0xFD][0xFF]=0xA0    # $VMS
reg[EI]=0x00
reg[EO]=0x00
reg[PG] = page
reg[PC] = 0
reg[Y] = 0xFD # $VMS
1300.times do |q|
  ram[0][0xFD][0xFF]=0xA0    # $VMS
  n = 0
  while true do
    c = fetch(rom, reg)
    case c>>13
    when 0 # ALUHL+A
      reg[A] = alu_fn(ram, rom[3], reg, c, false)
      set_dst(ram, reg, c, reg[A])
      reg[A] = alu_fn(ram, rom[2], reg, c, true, true)
      set_dst(ram, reg, c, reg[A])
      n += 4
    when 1 # ALUL
      x = alu_fn(ram, rom[3], reg, c, false)
      set_dst(ram, reg, c, x)
      n += 3
    when 2 # ALUH+A
      reg[A] = alu_fn(ram, rom[3], reg, c)
      set_dst(ram, reg, c, reg[A])
      n += 3
    when 3 # ROMH
      x = alu_fn(ram, rom[1], reg, c)
      set_dst(ram, reg, c, x)
      n += 3
    when 4 # NOP, LD
      n += 1
      next if c&0xF000 == 0x8000

      n += 1
      set_dst(ram, reg, c, rom[0][get_pc(reg)])
    when 5 # LDP, LDN
      n += 1
      if (c>>5)&0x80 == reg[A].to_i&0x80
#puts "COND: true"
        set_dst(ram, reg, c, rom[0][get_pc(reg)])
        n += 1
      else
#puts "COND: false"
        reg[PC] = reg[PC] + 1
      end
    when 6 # FNH+A
      reg[A] = alu_fn(ram, rom[3], reg, c)
      set_dst(ram, reg, c, reg[A])
      n += 2
    when 7 # FNH
      x = alu_fn(ram, rom[3], reg, c)
      set_dst(ram, reg, c, x)
      n += 2
    end
    #puts "[#{n}] #{reg[PC]}: #{c.to_s(16)}" # if c == 0x1F7F
    #puts reg.to_s
    break if c == 0x1F7F #|| reg[PC] == 0
  end
puts "|###|-->  INST:#{ram[0][0xE7][0xFF]} A:#{ram[0][0xF0][0xFF]} H:#{ram[0][0xF6][0xFF]} L:#{ram[0][0xF7][0xFF]} MEM:#{ram[0][0x21][0x21]}  <--|###|"
#  pp (0xA0..0xA7).map {|i| ram[0][i][0xFF].to_s(16)}
#puts "#{ram[0][0xA0][0xFF]>>4},#{(-1*ram[0][0xA5][0xFF])&0xff}"
end
