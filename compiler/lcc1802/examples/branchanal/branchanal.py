import sys
from opdefinitions import *
from opfunctions import *
print opsizes, jumpdefs
#print 'Number of arguments:', len(sys.argv), 'arguments.'
#print 'Argument List:', str(sys.argv)
asminfile = open(sys.argv[1],'r')
asmdata = asminfile.read().expandtabs()
asmlines = asmdata.split('\n')
print len(asmlines), 'lines read'

def jumper(i,tokens,pc):
	return 7

labeldefs={}
def stolabel(label,address):
    labeldefs[label]=address;
    #print label,address

def scanner(beginline,beginpc,target):
    print "scanner begins at line %d with PC %d and target %s\n" %(beginline,beginpc,target)
    progsize=beginpc;
    i=beginline
    for line in asmlines[beginline:]:
	#print '%3d %4X %s' % (i,progsize,asmlines[i])
        tokens=line.split();
        if tokens:
		if tokens[0].endswith(':'):
			stolabel(tokens[0][:-1],progsize);
			print '%4X %s' %(progsize,tokens[0])
			if tokens[0][:-1]==target:
				return progsize
		elif not tokens[0].startswith(';'):
			if tokens[0].lower() in jumpdefs:
				print "Oh Boy"
				progsize+=jumper(i,tokens,progsize)
			else:
				progsize+=process(tokens,progsize)
	i+=1;
                
    return -1

print 'scanner sez ',scanner(0,0,'**end**')

asmoutfile=open(sys.argv[1]+"O.asm",'w'); asmoutfile.truncate()
i=0
for line in asmlines:
	asmoutfile.write(line+'\n')
	i+=1
print i, 'lines written'
