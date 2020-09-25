#!/usr/bin/env ruby

def print_ext_addr(addr)
  print_data [2, 0, 0, 4, (addr >> 8) & 0xff, addr & 0xff]
end

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

print_ext_addr 0x0001
16.times do |i|
  16.times do |j|
    16.times do |j|


  16.times {|i| 16.times {|j| print_data [b.size, j, i << 4, 0] + b}}

  l.each_slice(16).each_with_index {|b, i| print_data [b.size, j, i << 4, 0] + b}
end
