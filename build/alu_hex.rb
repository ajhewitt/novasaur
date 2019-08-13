def print_ext_addr(addr)
  print_data [2, 0, 0, 4, (addr >> 8) & 0xff, addr & 0xff]
end

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

def print_binary(op, offset, s = 0)
  16.times.map do |a|
    16.times.map do |b|
      d = 16.times.map do |c|
        v = (op == '/' && a == 0) ? 0x10 : a << s
        (((b << 4) + c).send(op, v)) & 0xff
      end
      print_data([d.size, offset + a, b << 4, 0] + d)
    end
  end
end

# start of ALU high
print_ext_addr 0x0002
# 0x00020000-0x00020FFF: ADD high nibble
print_binary '+', 0x00, 4
# 0x00021000-0x00021FFF: SUB high nibble
print_binary '-', 0x10, 4
# 0x00022000-0x00022FFF: AND high nibble
print_binary '&', 0x20, 4
# 0x00023000-0x00023FFF: OR high nibble
print_binary '|', 0x30, 4
# start of ALU low
print_ext_addr 0x0003
# 0x00030000-0x00030FFF: ADD low nibble
print_binary '+', 0x00
# 0x00031000-0x00031FFF: SUB low nibble
print_binary '-', 0x10
# 0x00032000-0x00032FFF: AND low nibble
print_binary '&', 0x20
# 0x00033000-0x00033FFF: OR low nibble
print_binary '|', 0x30
# 0x00034000-0x00034FFF: MUL low nibble only
print_binary '*', 0x40
# 0x00035000-0x00035FFF: DIV low nibble only
print_binary '/', 0x50
# 0x0003C000-0x0003CFFF: VID low nibble only

# 0x0003D000-0x0003DFFF: FN0

# 0x0003E000-0x0003EFFF: FN1

# 0x0003F000-0x0003FFFF: FNH

