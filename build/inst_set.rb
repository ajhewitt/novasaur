DST = %w[N O1 O2 O3 O4 O5 O6 O7 X E S V Y HL PC PG]
SRC = %w[I IZ E EZ I IZ E EZ A AZ D0 D0Z A AZ D1 D1Z]
ALU = %w[MV ADD SUB AS AND OR XOR DEC MUL DIV ATT SER AV FND FNE FNF]
LD = %w[NOP NOPZ LD LDZ LDP LDPZ LDN LDNZ]
WR = %w[D0 D1]

def decode(i, a); a.each_with_index.map{|b, n| i[b] * (2 ** n)}.reduce(:+) end
def src(i); SRC[decode i,  [3, 4, 10, 11]] end
def dst(i); DST[decode i, [0, 1, 8, 9]] end
def rom(i); "ROM#{(decode i,  [12, 13, 14, 15]).to_s(16).upcase}" end

def ld(i, dest)
  n = decode i, [3, 4, 5]
  return LD[n] if n < 2

  return if i[2]  == 0

  "#{LD[n]} #{dest}, $D"
end

def alu(i, hl, dest)
  n = decode i,  [12, 13, 14, 15]
  z = i[3] == 1 ? 'Z' : ''
  return "MV#{hl}#{z} #{dest}" if n.zero?

  "#{ALU[n]}#{hl} #{src(i)}, #{dest}"
end

def inst(i)
  dest = dst(i)
  dest += (i[2] == 0 ? WR[i[10]] : 'A') if i[5] == 0
  case decode i, [5, 6, 7]
  when 0
    "#{alu(i, 'HL', dest)}"
  when 1
    "#{alu(i, 'L', dest)}"  if i[2] == 1
  when 2
    "#{alu(i, 'H', dest)}"
  when 3
    "#{rom(i)}H #{src(i)}, #{dest}" if i[2] == 1
  when 4
    ld(i, dst(i))
  when 5
    ld(i, dst(i))
  when 6
    "FNH #{src(i)}, #{dest}"
  when 7
    "FNH #{src(i)}, #{dest}" if i[2] == 1
  end
end

is = {}

(2**16).times do |n|
  i = 16.times.each_with_object([]) {|b, a| a[b] = n >> b & 1}
  next unless i[7] == 0
  is["#{inst(i)}"] ||= (n & 0xff).to_s(16).upcase.rjust(2, '0') + (n >> 8).to_s(16).upcase.rjust(2, '0')
end

(2**7).times do |n|
  i = 7.times.each_with_object([]) {|b, a| a[b] = n >> b & 1}
  i += Array.new 9, 1
  is[inst(i)] ||= (n + 0x80).to_s(16).upcase.rjust(2, '0')
end

is.delete nil
is.delete ""
is.reject! { |k, v| k.end_with? " N" }

require 'json'
puts JSON.pretty_generate is.sort_by {|_k,v| v}.to_h
