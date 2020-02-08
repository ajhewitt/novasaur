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

def print_line(i, j, l, n, s)
  puts "#{(i * n) + l}: [#{j}, #{s & 0xF}] #{
          (s & 0x10) >> 4} #{
          (s & 0x20) == 0 ? '#' : '.'} #{
          (s & 0x40) == 0 ? 'A' : 'B'}"
end

mode = ARGV.first.to_i # 0-18,20-22,24-26,28-30
n = [4,5][mode >> 4]
m = (mode & 3) * n
offset = 0xC000 + ((mode & 0x1C) * 64)
i = 0
j = 0
s = 0
puts "LINE#: [V, PA] BANK SYNC ACTIVE/BLANK"
while true
  n.times.each do |l|
    lmod = rom[offset + i]
    if lmod == 0
      n.times.each {|l| print_line(i, j, l, n, s)}
      exit
    end
    state = (m + l) * 256
    s = rom[0xC000 + state + lmod]
    print_line(i, j, l, n, s)
    j += 1 unless s & 0x80 == 0
  end
  i += 1
end
