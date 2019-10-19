def print_ext_addr(addr)
  print_data [2, 0, 0, 4, (addr >> 8) & 0xff, addr & 0xff]
end

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

print_ext_addr 0
16.times.map do |a|
  d = []
  16.times.each { d << 0x80 }
  d[15] = 0x9b if a == 15
  print_data [d.size, 0xff, a << 4, 0] + d
end
