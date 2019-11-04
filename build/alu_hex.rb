def print_ext_addr(addr)
  print_data [2, 0, 0, 4, (addr >> 8) & 0xff, addr & 0xff]
end

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

def print_binary(op, offset, opts = {})
  mask = opts[:high] ? 0x0f : 0xf0
  mask = 0 unless opts[:pass]
  16.times.map do |a|
    16.times.map do |b|
      d = 16.times.map do |c|
        x = (b << 4) + c
        y = a << (opts[:high] ? 4 : 0)
        y = 0x10 if (op == '/' && a == 0)
        ((op ? x.send(op, y) : y) & 0xff) | (x & mask)
      end
      print_data([d.size, offset + a, b << 4, 0] + d)
    end
  end
end

# start of ALU high
print_ext_addr 0x0002
# 0x00020000-0x00020FFF: MV high nibble
print_binary nil, 0x00, high: true, pass: true
# 0x00021000-0x00021FFF: ADD high nibble
print_binary '+', 0x10,  high: true
# 0x00022000-0x00022FFF: SUB high nibble
print_binary '-', 0x20,  high: true
# 0x00023000-0x00023FFF: AS high nibble

# 0x00024000-0x00024FFF: AND high nibble
print_binary '&', 0x40,  high: true, pass: true
# 0x00026000-0x00025FFF: OR high nibble
print_binary '|', 0x50,  high: true, pass: true
# 0x00027000-0x00026FFF: XOR high nibble
print_binary '^', 0x60,  high: true, pass: true
# 0x00027000-0x00027FFF: DPG high nibble


# start of ALU low
print_ext_addr 0x0003
# 0x00030000-0x00030FFF: MV low nibble
print_binary nil, 0x00, pass: true
# 0x00031000-0x00031FFF: ADD low nibble
print_binary '+', 0x10
# 0x00032000-0x00032FFF: SUB low nibble
print_binary '-', 0x20
# 0x00033000-0x00033FFF: AS low nibble

# 0x00034000-0x00034FFF: AND low nibble
print_binary '&', 0x40, pass: true
# 0x00035000-0x00035FFF: OR low nibble
print_binary '|', 0x50, pass: true
# 0x00036000-0x00036FFF: XOR low nibble
print_binary '^', 0x60, pass: true
# 0x00037000-0x00037FFF: DPG low nibble

# 0x00038000-0x00038FFF: MUL low nibble only
print_binary '*', 0x80
# 0x00039000-0x00039FFF: DIV low nibble only
print_binary '/', 0x90
# 0x0003A000-0x0003AFFF: FNA low nibble only

# 0x0003B000-0x0003BFFF: FNB low nibble only

# 0x0003C000-0x0003CFFF: VOL low nibble only

# 0x0003D000-0x0003DFFF: AV low nibble only

# 0x0003E000-0x0003EFFF: SER low nibble only

# 0x0003F000-0x0003FFFF: FNF low nibble only

