# Output video timing for one of 32 modes
filename = 'chips/rom/alu.hex'
file = File.open filename
rom = []
file.each do |l|
  size = l[1, 2].to_i(16)
  addr = l[3, 4].to_i(16)
  next unless l[7, 2].to_i(16) == 0
  size.times {|i| rom[addr + i] = l[(i * 2) + 9, 2].to_i(16)}
end

mode = ARGV.first.to_i # 0..31
m = (mode & 3) * 4 # 0,4,8,12
offset = 0xD000 + ((mode & 0x1C) * 64)
i = 0
j = 0
puts "LINE#: [V, PA] MODE0 SYNC ACTIVE/BLANK"
while true
  4.times.each do |l|
    lmod = rom[offset + i]
    exit if lmod == 0
    state = (m + l) * 256
    s = rom[0xD000 + state + lmod]
    puts "#{(i * 4) + l}: [#{j}, #{s & 0xF}] #{
            (s & 0x10) >> 4} #{
            (s & 0x20) == 0 ? '-' : '+'} #{
            (s & 0x40) == 0 ? 'A' : 'B'}"
    j += 1 unless s & 0x80 == 0
  end
  i += 1
end
