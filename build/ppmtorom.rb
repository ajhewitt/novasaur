#!/usr/bin/env ruby

# Convert JPG image (less than 256x256) to 256-color 3:3:2 image rom
# jpegtopnm images/parrot.jpg | pnmnoraw > build/output/parrot.ppm
# build/ppmtorom.rb build/output/parrot.ppm > build/output/cold.hex

def print_ext_addr(addr)
  print_data [2, 0, 0, 4, (addr >> 8) & 0xff, addr & 0xff]
end

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

file = File.open(ARGV[0])
exit 1 unless file.first.strip == "P3"
(x, y) = file.first.split(' ').map(&:to_i)
z = file.first.to_f * 1.2

print_ext_addr 0x0001
file.to_a.map(&:strip).join(' ').split(' ').each_slice(3).each_slice(x).each_with_index do |r, j|
  l = Array.new(16, 0)
  l += r.map do |p|
    q = p.map {|a| a.to_f/z}
    w = (q[0]*8).to_i
    w += (q[1]*64).to_i & 0x38
    w += (q[2]*256).to_i & 0xC0
  end
  l += Array.new(240-x, 0)
  l.each_slice(16).each_with_index {|b, i| print_data [b.size, j, i << 4, 0] + b}
end
