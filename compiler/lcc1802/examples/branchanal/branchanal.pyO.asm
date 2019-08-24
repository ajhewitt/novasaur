import sys
from definitions import *
print opsizes, jumpdefs
print 'Number of arguments:', len(sys.argv), 'arguments.'
print 'Argument List:', str(sys.argv)
asminfile = open(sys.argv[1],'r')
asmdata = asminfile.read().expandtabs()
asmlines = asmdata.split('\n')
print len(asmlines), 'lines read'

def jumper(i,tokens,pc):
        return 7
def process(tokens,pc):
        return 13

labeldefs={}
def stolabel(label,address):
    labeldefs[label]=address;
    #print label,address

def scanner(beginline,beginpc,target):
    print "scanner begins at line %d with PC %d and target %s\n" %(beginline,beginpc,target)
    progsize=beginpc;
    i=beginline
    for line in asmlines[beginline:]:
        tokens=line.split();
        if tokens:
                if tokens[0].endswith(':'):
                        stolabel(tokens[0][:-1],progsize);
                        print '%4X %s' %(progsize,tokens[0])
                        if tokens[0][:-1]==target:
                                return progsize
                if not tokens[0].startswith(';'):
                        if tokens[0] in jumpdefs:
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

