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

# Output CSV containing one wave per column
alu = load_rom[3]
offset = 0x6000
256.times do |a|
  puts 16.times.map {|b| alu[offset + a + b*256]}.pack('C*').unpack('c*').join(',')
end
