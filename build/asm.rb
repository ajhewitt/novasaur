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

  "#{LD[n]} #{dest},"
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

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

is = {}

(2**16).times do |n|
  i = 16.times.each_with_object([]) {|b, a| a[b] = n >> b & 1}
  next unless i[7] == 0
  is["#{inst(i)}"] ||= [n&0xff, n>>8]
end

(2**7).times do |n|
  i = 7.times.each_with_object([]) {|b, a| a[b] = n >> b & 1}
  i += Array.new 9, 1
  is["#{inst(i)}"] ||= n+128
end

is.delete nil
is.delete ""
is.reject! { |k, v| k.end_with? " N" }

abort("FILENAME?") unless filename = ARGV[0]
abort("PAGE?") unless page = Integer(ARGV[1]) rescue nil

file = File.open filename
src = file.readlines.map(&:chomp)
labels = {}
vars = {}
o = []
i = 0

src.each_with_index do |l, j|
  a = l.split
  b = a.first
  if b&.start_with? '$'
    c = l.partition '='
    if c[1].empty?
      labels[b[1..-1]] = i
    else
      vars[c[0][1..-1]] = c[2].strip
    end
  else
    d = l.partition(/\$|#/)[0].strip
    next if d.empty?
    abort("#{j}: SYNTAX? #{d}") if is[d].nil?
    i += is[d].size>>1
    abort("#{j}: END_OF_PAGE?") if i > 255
  end
end

src.each_with_index do |l, j|
  a = l.split
  b = a.first
  next if b&.start_with? '$'
  c = l.partition(/\$|#/)
  d = c[0].strip
  next if d.empty?
  o << is[d]
  if c[1] == '$'
    e = c[2].split[0]
    f = e.split '$'
    f.each {|g| abort("#{j}:UNDEF? $#{g}") if vars[g].nil?}
    v = Integer(vars[f[0]]) rescue abort("#{j}: SYNTAX? $#{f[0]}")
    if f.size > 1
      v <<= 4
      v += Integer(vars[f[1]]) rescue abort("#{j}: SYNTAX? $#{f[1]}")
    end
    abort("#{j}: OVERFLOW? $#{e}=0x#{v.to_s(16).upcase}") if v > 255
    o << v
  end
end

p = Array.new(256 - o.flatten.size, 128)
p[-2] = 0x9f if p.size >= 2
o << p

o.flatten.each_slice(16).each_with_index do |b, i|
  print_data [b.size, page, i << 4, 0] + b
end
