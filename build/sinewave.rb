def print_ext_addr(addr)
  print_data [2, 0, 0, 4, (addr >> 8) & 0xff, addr & 0xff]
end

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

w = 256.times.map {|i| (Math.sin(i * Math::PI/128)*127.5).floor&0xff}
w.each_slice(16).each_with_index {|d, i| print_data [d.size, 0xf1, i << 4, 0] + d}
