#!/usr/bin/env ruby

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

def load_rom(filename)
  file = File.open filename
  rom = Array.new(0x10000, 0xFF)
  min = 0x10000
  max = 0
  file.each do |l|
    if l.start_with? ':'
      case l[7, 2].to_i(16)
      when 0
        size = l[1, 2].to_i(16)
        addr = l[3, 4].to_i(16)
        min = addr if addr < min
        top = addr + size - 1
        max = top if top > max
        size.times {|i| rom[addr + i] = l[(i * 2) + 9, 2].to_i(16)}
      end
    end
  end
  size = max - min
  rom[min, (1+((size)/256))*256]
end

filename = ARGV.first
exit unless filename && ARGV.length == 2
page = Integer ARGV[1]
load_rom(filename).each_slice(256).each_with_index do |a, j|
  a.each_slice(16).each_with_index {|b, i| print_data [b.size, page+j, i << 4, 0] + b}
end
