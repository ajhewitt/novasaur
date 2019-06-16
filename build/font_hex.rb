def print_ext_addr(addr)
  print_data [2, 0, 0, 4, (addr >> 8) & 0xff, addr & 0xff]
end

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

def parse_header(file)
  h = {}
  file.each do |l|
    break if l.match(/%$/)
    p = l.strip.split(/:\s+/)
    h.store(p[0].downcase.to_sym, Integer(p[1])) rescue next
  end
  h
end

def parse_glyph(file, w, h)
  g = []
  i = 0
  file.each do |l|
    if i == 0
      i = l.match(/Bitmap:\s+/).to_s.size
      next unless i > 0
    end
    h -= 1
    break if h < 0
    r = 0
    l[i, w].split('').map do |b|
      r <<= 1
      r |= 1 if b == '#'
    end
    g << r
  end
  g
end

def print_font(filename, offset)
  file = File.open filename
  h  = parse_header file
  h[:length].times.each do |i|
    g = parse_glyph(file, h[:width], h[:height])
    print_data([g.size, offset + (i >> 4), (i << 4) & 0xf0, 0] + g)
  end
end

def print_dither(offset)
  d = [
    [0b1100,
     0b1100,
     0b1100,
     0b1100],
    [0b1000,
     0b0100,
     0b0100,
     0b1000],
    [0b0010,
     0b0001,
     0b0001,
     0b0010],
    [0b1010,
     0b0101,
     0b0101,
     0b1010]
  ]
  4.times.each do |a|
    256.times.each do |b|
      print_data([8, offset + (a << 4) + (b >> 4), (b << 4) & 0xf0 | 8, 0] +
                 2.times.map {d[a].map {|n| n * 0x11}}.flatten)
    end
  end
end

# start of ALU high
print_ext_addr 0x0002
# 0x00028000-0x00028FFF: standard 8x8 font
print_font '../fonts/Bm437_IBM_BIOS.txt', 0x80
# 0x00029000-0x00029FFF: bold 8x8 font

# 0x0002A000-0x0002AFFF: italic 8x8 font

# 0x0002B000-0x0002BFFF: underlined 8x8 font

# 0x00028000-0x0002BFFF: dithering patterns
print_dither 0x80

# 0x0002C000-0x0002CFFF: standard 8x16 font
print_font '../fonts/Bm437_IBM_VGA8.txt', 0xC0
# 0x0002D000-0x0002DFFF: bold 8x16 font

# 0x0002E000-0x0002EFFF: italic 8x16 font

# 0x0002F000-0x0002FFFF: underlined 8x16 font

