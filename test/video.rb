#!/usr/bin/env ruby

def load_rom
  filename = 'build/output/alu.hex'
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

def print_line(i, j, l, n, s)
  puts "#{(i * n) + l}: [#{j}, #{s & 0xF}] #{
          (s & 0x10) >> 4} #{
          (s & 0x20) == 0 ? '#' : '.'} #{
          (s & 0x40) == 0 ? 'A' : 'B'}"
end

# Output video timing for one of 32 modes
mode = ARGV.first.to_i
n = [3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5][mode]
m = [0,0,0,3,3,3,3,7,7,7,7,3,3,3,3,7,7,7,7,11,11,11,11,11][mode]
p = [0,1,2,3,4,5,6,7,8,9,10,3,4,5,6,7,8,9,10,11,12,13,14,15][mode]
offset = 0xB000 + (p * 0x100)
alu = load_rom[3]
i = 0
j = 0
s = 0
puts "LINE#: [V, PA] BANK SYNC ACTIVE/BLANK"
while true
  n.times.each do |l|
    lmod = alu[offset + i]
    exit if lmod == 0
    state = (m + l) * 256
    s = alu[0xB000 + state + lmod]
    print_line(i, j, l, n, s)
    j += 1 unless s & 0x80 == 0
  end
  i += 1
end
