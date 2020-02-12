#!/usr/bin/env ruby

# Use PSF tools to generate text font files: https://www.seasip.info/Unix/PSF
# Starting with FON files, use 'fon2fnts' to extract font-file.fnt
# fnt2psf font-file.fnt | psf2txt > font-file.txt
# Font ROM Row Assignments
# 0-7: 8x8 glyph fonts
# 8: underline - last row of mod10 fonts, all 0's or 1's for underline
# 9: blank - first row of mod10 fonts/low-res graphics, all 0's
# 10-13: top 4 rows of 8x6 glyph fonts (followed by rows 6,7)
# 14,15: dither patterns
# 16-31: 8x16 glyph fonts
DITHER = [
  [0b1100,
   0b1100],
  [0b1000,
   0b0100],
  [0b0001,
   0b0010],
  [0b1001,
   0b0110]
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
      print_data([0x10, offset + (a << 5) + (b >> 4) , (b << 4) & 0xf0, 0] +
        16.times.map {DITHER[a][b >> 4] * 0x11})
    end
  end
end

def print_line(offset, solid)
  16.times.each do |a|
    print_data([0x10, offset, a << 4, 0] +
      Array.new(16) {solid ? 0xff : 0})
  end
end

def print_underline(offset, underline)
  print_line(offset, underline)
  print_line(offset + 1, false)
end

# start of ALU high
print_ext_addr 0x0002
print_dither 0x8E

# 0x00028000-0x000287FF: thick serif 8x8 font
# IBM PC BIOS. ca. 1981
print_font 'fonts/Bm437_IBM_BIOS.txt', 0x80
print_underline 0x88, false
# 0x00029000-0x00029FFF: thick serif 8x16 font
# IBM PS/2 VGA/MCGA. ca. 1987
print_font 'fonts/Bm437_IBM_VGA8.txt', 0x90

# 0x0002A000-0x0002A7FF: thin serif 8x8 font
# COMPAQ MS-DOS 3.31 (Rev. G). ca. 1990
print_font 'fonts/Bm437_CompaqThin_8x8_6.txt', 0xA0
print_underline 0xA8, false
# 0x0002B000-0x0002BFFF: thin serif 8x16 font
# COMPAQ MS-DOS 3.31 (Rev. G). ca. 1990
print_font 'fonts/Bm437_CompaqThin_8x16.txt', 0xB0

# 0x0002D000-0x0002DFFF: thick san-serif 8x8 font
# Chips and Technologies, Inc. 82C435 Enhanced Graphics Controller. ca. 1985
print_font 'fonts/Bm437_PhoenixEGA_8x8.txt', 0xC0
print_underline 0xC8, false
# 0x0002D000-0x0002DFFF: thick san-serif 8x16 font
# Chips and Technologies, Inc. 82C435 Enhanced Graphics Controller. ca. 1985
print_font 'fonts/Bm437_PhoenixEGA_8x16.txt', 0xD0

# 0x0002D000-0x0002DFFF: thick san-serif 8x8 font
# Chips and Technologies, Inc. 82C435 Enhanced Graphics Controller. ca. 1985
print_font 'fonts/Bm437_PhoenixEGA_8x8.txt', 0xE0
print_underline 0xE8, true
# 0x0002D000-0x0002DFFF: thick san-serif 8x14 font
# Chips and Technologies, Inc. 82C435 Enhanced Graphics Controller. ca. 1985
print_font 'fonts/Bm437_PhoenixEGA_8x14.txt', 0xF0
print_underline 0xFE, true
