a = 128.times.map do |n|
  f = 440 * 2.0**((n-69)/12.0)
  x = (254 * 256) * f / 9600 % 0xffff
  [n, f, x.round.to_s(16).upcase.rjust(4, '0')]
end

a.each {|n| puts n.to_s}
