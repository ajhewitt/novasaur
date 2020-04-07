#!/usr/bin/env ruby

DST = %w[N O1 O2 O3 O4 O5 O6 O7 X E S V Y HL PC PG]
SRC = %w[I IZ E EZ I IZ E EZ A AZ M MZ A AZ D DZ]
ALU = %w[MV ADD SUB AF AND OR XOR VMP MUL DIV COM SER AV ATT FNE FNF]
LD = %w[NOP NOPZ LD LDZ LDP LDPZ LDN LDNZ]
WR = %w[M D]

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
  return if i[2] == 0 && (dest == 'Y' || (dest == 'X' && i[3] == 0))
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
  is["#{inst(i)}"] ||= [n+128]
end

is.delete nil
is.delete ""
is.reject! { |k, v| k.end_with? " N" }

vars = {}
if filename = ARGV.first
  if filename.upcase == 'BOOT'
    src = []
    page = 'BOOT'
    vars[page] = 0xFF
  else
    file = File.open filename
    src = file.readlines.map(&:chomp)
    page = nil
  end
else
  require 'json'
  abort JSON.pretty_generate is.map {|k,v|
    k += " $BYTE" if k.start_with? 'LD'
    [k, v.map {|x| sprintf("%02x",x)}.join.upcase]
  }.sort_by {|_k,v| v}.to_h
end

addrs = {}
incs = []
i = 0
src.each_with_index do |l, j|
  a = l.partition('#').first
  next if a.empty?

  if a&.start_with? '$'
    b = a.split
    k = b.first[1..-1]
    if b.size > 1
      vars[k] = b[1]
    else
      vars[k] = i
    end
  else
    b = a.partition('$')
    c = b.first.strip
    d = c.split
    next if d.empty?

    case d.first.upcase
    when 'PAGE'
      abort("#{j}: PAGE? #{d[1]}") unless page = d[1].strip
    when 'INCLUDE'
      incs << d[1]
    when 'ADDR'
      i = Integer(d[1].strip) rescue abort("#{j}: ADDR? #{d[1]}")
    else
      abort("#{j}: SYNTAX? #{c}") if is[c].nil?
      addrs[j] = i
      i += is[c].size
      i += 1 if b[1] == '$'
      abort("#{j}: END_OF_PAGE?") if i > 256
    end
  end
end

incs.each do |incname|
  dir = filename.rpartition '/'
  incfile = File.open [dir.first, incname].join(dir[1])
  incfile.readlines.map(&:chomp).each do |l|
    a = l.partition('#').first.strip
    b = a.split.first
    next unless b&.start_with? '$'

    d = a.partition /\s+/
    e = d.first[1..-1]&.strip
    vars[e] = d[2].strip if vars[e].nil?
  end
end

page = Integer(vars[page]) rescue abort("NO_PAGE? #{page}")

o = Array.new 256, 128
src.each_with_index do |l, j|
  a = l.partition(/\$|#/)
  b = a.first.strip
  next unless c = is[b]

  i = addrs[j]
  c.each do |k|
    o[i] = k
    i += 1
  end
  if a[1] == '$'
    c = a[2].split.first
    d = c.split '$'
    e = d.first
    if vars[e].nil?
      v = Integer(e) rescue abort("#{j}:UNDEF? $#{e}")
    else
      v = Integer(vars[e]) rescue abort("#{j}: SYNTAX? $#{e}")
    end
    if d.size > 1
      v <<= 4
      if vars[d[1]].nil?
        v += Integer(d[1]) rescue abort("#{j}:UNDEF? $#{d[1]}")
      else
        v += Integer(vars[d[1]]) rescue abort("#{j}: SYNTAX? $#{d[1]}")
      end
    end
    abort("#{j}: OVERFLOW? $#{c}, 0x#{v.to_s(16).upcase}") if v > 255
    o[i] = v
    i += 1
  end
end

o[254] = 0x9f if i < 255

o.each_slice(16).each_with_index {|b, i| print_data [b.size, page, i << 4, 0] + b}
