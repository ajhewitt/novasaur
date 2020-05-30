x = 0
puts 1000.times.map {|i| x<<=1;x&=0xff;x+=((x>>7==x&1)?1:0);x}
#(sprintf "%08b", x)}

