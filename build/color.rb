# Generate palette base on M/C of linear equation.
# ruby color.rb | pnmtopng > output/color-palette.png
#Ron 165 ohms [M, C]
RG=[95.37, 69.06]
B=[213.23, 66.18]
#Ron 150 ohms [M, C]
#RG=[100, 72]
#B=[223, 69]

R0=150
R1=300
R2=604
Ron=165
RL=75
Vh=3.2
Vl=0.3
#you can also calculate value of C
C=1000*Vl*RL/((1/((1.0/R0)+(1.0/R1)+(1.0/R2)))+Ron+RL)

def color(eq, val, max = 700)
  millivolts = val*eq[0] + eq[1]
  c = ((millivolts/max)*0xFF).floor
  c > 0xFF ? 0xFF : c
end

puts "P3\n16 16\n255"
2.times do |a|
  8.times do |r|
    2.times do |b|
      8.times do |g|
        print "#{color(RG, g)} #{color(RG, r)} #{color(B, (a<<1)+b)} "
      end
      puts
    end
  end
end

