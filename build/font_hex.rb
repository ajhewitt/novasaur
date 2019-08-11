DITHER = [
  [0b1100,
   0b1100],
  [0b0100,
   0b1000],
  [0b0001,
   0b0010],
  [0b0101,
   0b1010]
]

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
  font = h[:length].times.map {|i| parse_glyph(file, h[:width], h[:height])}
  h[:height].times do |a|
    (0..font.size-1).step(16) do |b|
      print_data([0x10, offset + a, b, 0] + 
                 16.times.map {|c| font[b + c][a]})
    end
  end
end


def print_dither(offset)
  4.times.each do |a|
    32.times.each do |b|
      next if (a >> 1) & 1 != (b >> 3) & 1
      print_data([0x10, offset + (a << 4) + (b >> 4), (b << 4) & 0xf0, 0] +
                 16.times.map {DITHER[a][(b >> 4) & 1] * 0x11})
    end
  end
end

# start of ALU high
print_ext_addr 0x0002
# 0x00028000-0x000287FF: thick serif 8x8 font
# IBM PC BIOS. ca. 1981
print_font 'fonts/Bm437_IBM_BIOS.txt', 0x80
# 0x00029000-0x000297FF: thin serif 8x8 font
# COMPAQ MS-DOS 3.31 (Rev. G). ca. 1990
print_font 'fonts/Bm437_CompaqThin_8x8_6.txt', 0x90
# 0x0002A000-0x0002A7FF: thick san-serif 8x8 font
# Amstrad PC1512. ca. 1986
print_font 'fonts/Bm437_AmstradPC1512.txt', 0xA0
# 0x0002B000-0x0002B7FF: thin san-serif 8x8 font
# Kaypro 2000. ca. 1985
print_font 'fonts/Bm437_Kaypro2K.txt', 0xB0
# 0x00028800-0x0002BFFF: dithering patterns
print_dither 0x88
# 0x0002C000-0x0002CFFF: thick serif 8x16 font
# IBM PS/2 VGA/MCGA. ca. 1987
print_font 'fonts/Bm437_IBM_VGA8.txt', 0xC0
# 0x0002D000-0x0002DFFF: thin serif 8x16 font
# COMPAQ MS-DOS 3.31 (Rev. G). ca. 1990
print_font 'fonts/Bm437_CompaqThin_8x16.txt', 0xD0
# 0x0002E000-0x0002EFFF: thick san-serif 8x16 font
# Chips and Technologies, Inc. 82C435 Enhanced Graphics Controller. ca. 1985
print_font 'fonts/Bm437_PhoenixEGA_8x16.txt', 0xE0
# 0x0002F000-0x0002FFFF: thin san-serif 8x16 font
# IBM PC DOS 5.02 (ISO 9241-3:1992). ca. 1992
print_font 'fonts/Bm437_IBM_ISO8_12.txt', 0xF0
