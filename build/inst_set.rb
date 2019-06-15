i8 = %w[NOP JMP BPZ BN PJ PJT PBPZ PBNT]
r8 = %w[PC V X Y HL E EX EY]
p8 = [%w[A RAM0], %w[RAM0], %w[A RAM1], %w[A], %w[RAM0 RAM0], %w[X], %w[RAM1 RAM1], %w[E]]
p4 = p8.first 4
p2 = p4.last 2
alu8 = %w[RC0 RC2 RC4 RC6 ADD SUB AND OR]
alu16 = %w[MUL DIV MOD RC8 RC9 FN0 FN1 FNH]

fn0 = %w[SQRT POW2 POW3 INV SIN ASIN COS ACOS TAN ATAN EXP LN LOG LOG2 ABS TBD]
fnh = %w[INC DEC INC2 DEC2 1COM 2COM ROR ROL LSR LSL ASR ASR4 SR4 SL4 CPZ IDEN]

i = []
i[0] = i8.first
i << i8.last(7).map {|i| "#{i} D"}
i << r8.map {|i| "LD #{i}, D"}
i << p2.map {|p| r8.map {|r| ["LDZ #{r}, D", p[1]].compact.join(", ")}}
i << p4.map {|p| alu8.map {|f| ["#{f} #{p[0]}, HL", p[1]].compact.join(", ")}}
i << p8.map {|p| r8.map {|r| ["FNH #{p[0]}, #{r}", p[1]].compact.join(", ")}}
i << p8.map {|p| alu8.map {|f| ["#{f} #{p[0]}, L", p[1]].compact.join(", ")}}
i << p8.map {|p| alu16.map {|f| ["#{f} #{p[0]}, L", p[1]].compact.join(", ")}}

i.flatten.each_with_index {|i, n| puts "%02X: %s" % [n, i]}
