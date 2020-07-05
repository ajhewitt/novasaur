def print_avt(offset)
  # Verical timing: [active,back,sync,front]
  # Process cycles: [active,sync,porch]
  # Mode-line number(s): [(start..end)],[...]]
  # Process cycles per pattern: [mode0, mode1,...]
  # Modulo(s) per mode: [[mode0,...],[mode1,...]
  vid = [[[480,10,2,33], [160,4,11], [(8..10)], [4,2,8], [[2], [3], [8]]],       # 838x480@60 (vga60)
         [[480,1,3,28], [120,1,7], [(0..3), (4..7)], [2,5], [[2,8], [4,10]]],    # 670x492@75 (vga75)
         [[480,11,8,13], [120,5,3], [(0..3), (4..7)], [6,5], [[3,8], [2,10]]],   # 820x494@75 (vgarb)
         [[600,1,4,35], [150,2,8], [(0..3), (4..7)], [15,12], [[5,10], [3,16]]], # 660x608@60 (svga60)
         [[600,15,8,17], [150,6,4], [(0..3), (4..7)], [5,12], [[4,10], [3,16]]], # 820x622@60 (svgarb)
         [[768,3,6,23], [153,3,4], [(11..15)], [5,8,16], [[4], [8], [16]]],      # 520x762@60 (xga60)
         [[768,13,8,11], [153,5,2], [(11..15)], [6,16], [[3], [16]]]]            # 648x777@60 (xgarb)
  seq = {2=>[14,15,15,14], 3=>[14,15], 4=>[10,11,12,13],
         5=>[10,11,12,13,12,11], 6=>[10,11,12,13,12,11],
         8=>[0,1,2,3,4,5,6,7], 10=>[9,0,1,2,3,4,5,6,7,8],
         16=>[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]}
  rom = Array.new(16) { Array.new(255, 0xFF) }
  h = Hash.new 0
  a = 0
  vid.each do |v|
    u = 0
    u = v[0].map {|t| u+=t}
    v[4].each_with_index do |c, i| # timing columns 
      c.each_with_index do |d, j| # timing columns
        p = 0
        t = 0
        v[1].each_with_index do |b, k| # process cycles
          b.times do
            v[2][j].each do |r|
              #rom[a][p] = 
              s = (t>=u[1] && t<u[2]) ? 0 : 0x20 # vsync active low
              if t<u[0]
                s |= seq[d][t%seq[d].size] # set glyph line
                s |= 0x80 if (t%d).zero? # inc V at start of glyph
              else
                s |= 0x49 # hblank active high
              end
              puts "#{t} [#{p%d}, #{r}]: #{s.to_i.to_s(16)}"
              t += 1
            end
            p += 1
          end
        end
      end
      a += 1
    end
  end
end

print_avt(0)
