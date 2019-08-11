# Use this script to test font rom.
# Result is 256x1024 bitmap image as a PNG
# ruby test/font2pbm.rb | pnmtopng > font.png

filename = 'chips/rom/font.hex'
file = File.open filename
rom = []
file.each do |l|
  size = l[1, 2].to_i(16)
  addr = l[3, 4].to_i(16)
  next unless l[7, 2].to_i(16) == 0
  size.times {|i| rom[addr + i] = l[(i * 2) + 9, 2].to_i(16)}
end
rom.compact!
printf("P1\n%d %d\n", 0x800, rom.size >> 8)
i = 0
while i < rom.size
    16.times do |sc|
      256.times do |cp|
        addr = (i & 0xf000) + (sc << 8) + cp
        printf("%08b", rom[addr] || 0)
        i += 1
      end
      printf("\n")
    end
end
