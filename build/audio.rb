#!/usr/bin/env ruby

def midi(t)
  128.times.map { |n|
    f = 440 * 2.0**((n-69)/12.0)
    x = 0x10000 * f / t % 0xffff
    [n, f, x.round.to_s(16).upcase.rjust(4, '0')]
  }
end

puts "Midi for 20vmc process"
midi(412500 / 43).each {|n| puts n.to_s}

puts "Midi for 18vmc process"
midi(1375000 / 131).each {|n| puts n.to_s}

