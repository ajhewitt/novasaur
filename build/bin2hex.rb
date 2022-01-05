#!/usr/bin/env ruby

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

def load_rom(filename)
  file = File.open filename, 'rb'
  rom = file.read.unpack("C*")
  rom + Array.new((rom.size/1024.0).ceil*1024-rom.size, 26)
end

filename = ARGV.first
exit unless filename && ARGV.length == 2
page = Integer ARGV[1]
load_rom(filename).each_slice(256).each_with_index do |a, j|
  a.each_slice(16).each_with_index {|b, i| print_data [b.size, page+j, i << 4, 0] + b}
end
