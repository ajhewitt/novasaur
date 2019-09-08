DST = %w[A E1 E2 E3 E4 E5 E6 E7 PG PC SC V E HL X Y]
SRC = %w[E A D0 D0S E AZ D0 D0Z E A D1 D1S E AZ D1 D1Z]
ALU = %w[MV ADD SUB AS AND OR XOR DEC MUL DIV FNA FNB FNC FND FNE FNF]
LD = %w[NOP NOPZ LD LDZ LDP LDPZ LDN LDNZ]

def decode(i, a); a.each_with_index.map{|b, n| i[b] * (2 ** n)}.reduce(:+) end
def src(i); SRC[decode i,  [3, 4, 13, 14]] end
def dst(i); DST[decode i, [0, 1, 2, 15]] end
def rom(i); "ROM#{(decode i,  [8, 9, 10, 11]).to_s(16).upcase}" end

def ld(i, dest)
  n = decode i, [3, 4, 5]
  return LD[n] if n < 2

  "#{LD[n]} #{dest}, $OP"
end

def alu(i, hl, dest)
  n = decode i,  [8, 9, 10, 11]
  return "MV#{hl} #{dest}" if n.zero?

  "#{ALU[n]}#{hl} #{src(i)}, #{dest}"
end

def inst(i)
  dest = dst(i)
  dest += "W" if i[12] == 0
  case decode i, [5, 6, 7]
  when 0
    "#{alu(i, 'HL', dest)}"
  when 1
    "#{alu(i, 'L', dest)}"
  when 2
    "#{rom(i)} #{src(i)}, #{dest}"
  when 3
    "#{alu(i, 'H', dest)}"
  when 4
    ld(i, dest)
  when 5
    ld(i, dest)
  when 6
    "ROMH #{src(i)}, #{dest}"
  when 7
    "FNH #{src(i)}, #{dest}"
  end
end

is = {}

(2**16).times do |n|
  i = 16.times.each_with_object([]) {|b, a| a[b] = n >> b & 1}
  next unless i[7] == 0
  is["#{inst(i)}"] ||= [n >> 8, n & 0xff]
end

(2**7).times do |n|
  i = 7.times.each_with_object([]) {|b, a| a[b] = n >> b & 1}
  i += [1, 1, 1, 1, 1, 1, 1, 1, 1]
  is[inst(i)] ||= [n + 0x80]
end

require 'json'
puts JSON.pretty_generate is
