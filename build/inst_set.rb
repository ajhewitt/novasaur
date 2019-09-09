DST = %w[N E1 E2 E3 E4 E5 E6 E7 X E SC V Y HL PC PG]
SRC = %w[I0 E0 I0Z E0Z I1 E1 I1Z E1Z A0 D0 A0Z D0Z A1 D1 A1Z D1Z]
ALU = %w[MV ADD SUB AS AND OR XOR DEC MUL DIV FNA FNB FNC FND FNE FNF]
LD = %w[NOP NOPZ LD LDZ LDP LDPZ LDN LDNZ]

def decode(i, a); a.each_with_index.map{|b, n| i[b] * (2 ** n)}.reduce(:+) end
def src(i); SRC[decode i,  [2, 3, 4, 10]] end
def dst(i); DST[decode i, [0, 1, 8, 9]] end
def rom(i); "ROM#{(decode i,  [12, 13, 14, 15]).to_s(16).upcase}" end

def ld(i, dest)
  n = decode i, [3, 4, 5]
  return LD[n] if n < 2

  "#{LD[n]} #{dest}, $OP"
end

def alu(i, hl, dest)
  n = decode i,  [12, 13, 14, 15]
  z = i[3] == 1 ? 'Z' : ''
  return "MV#{hl}#{z} #{dest}" if n.zero?

  "#{ALU[n]}#{hl} #{src(i)}, #{dest}"
end

def inst(i)
  dest = dst(i)
  dest += "W" if i[11] == 0
  case decode i, [5, 6, 7]
  when 0
    "#{alu(i, 'HL', dest)}"
  when 1
    "#{alu(i, 'L', dest)}"
  when 2
    "#{alu(i, 'H', dest)}"
  when 3
    "#{rom(i)}H #{src(i)}, #{dest}"
  when 4
    ld(i, dest)
  when 5
    ld(i, dest)
  when 6
    "FNH #{src(i)}, #{dest}A"
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
#puts JSON.pretty_generate is
puts is.count
