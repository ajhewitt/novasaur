#!/usr/bin/env ruby

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

def load_rom(filename)
  file = File.open filename
  rom = []
  file.each do |l|
    rom << l.scan(/.{1,2}/).map {|a| a.to_i 16}
  end
  rom.flatten
end

filename = ARGV.first
exit unless filename && ARGV.length == 2
page = Integer ARGV[1]
load_rom(filename).each_slice(256).each_with_index do |a, j|
  a.each_slice(16).each_with_index {|b, i| print_data [b.size, page+j, i << 4, 0] + b}
end
