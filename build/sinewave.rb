def print_ext_addr(addr)
  print_data [2, 0, 0, 4, (addr >> 8) & 0xff, addr & 0xff]
end

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end
r = 160
a = r / 2.0
b = a - 0.5
c = 256 - a
p = 480
d = 3840.0 / p
w = 256.times.map {|i| (sprintf "%08b", (Math.sin(i * Math::PI/d) * b).floor + c).reverse.to_i(2)}
w.each_slice(16).each_with_index {|d, i| print_data [d.size, 0xf1, i << 4, 0] + d}
