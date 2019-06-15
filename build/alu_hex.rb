def print_ext_addr(addr)
  print_data [2, 0, 0, 4, (addr >> 8) & 0xff, addr & 0xff]
end

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

def print_binary(op, offset, s = 0)
  (0..15).map do |a|
    (0..15).map do |b|
      d = (0..15).map do |c|
        (((b << 4) + c).send(op, a << s)) & 0xff rescue 0
      end
      print_data([d.size, offset + a, b << 4, 0] + d)
    end
  end
end

# start of ALU high
print_ext_addr 0x0002
# 0x00024000-0x00024FFF: ADD high nibble
print_binary '+', 0x40, 4
# 0x00025000-0x00025FFF: SUB high nibble
print_binary '-', 0x50, 4
# 0x00026000-0x00026FFF: AND high nibble
print_binary '&', 0x60, 4
# 0x00027000-0x00027FFF: OR high nibble
print_binary '|', 0x70, 4
# start of ALU low
print_ext_addr 0x0003
# 0x00034000-0x00034FFF: ADD low nibble
print_binary '+', 0x40
# 0x00035000-0x00035FFF: SUB low nibble
print_binary '-', 0x50
# 0x00036000-0x00036FFF: AND low nibble
print_binary '&', 0x60
# 0x00037000-0x00037FFF: OR low nibble
print_binary '|', 0x70
# 0x00038000-0x00038FFF: MUL low nibble only
print_binary '*', 0x80
# 0x00039000-0x00039FFF: DIV low nibble only
print_binary '/', 0x90
# 0x0003A000-0x0003AFFF: MOD low nibble only
print_binary '%', 0xA0
# 0x0003D000-0x0003DFFF: FN0

# 0x0003E000-0x0003EFFF: FN1

# 0x0003F000-0x0003FFFF: FNH

