from opdefinitions import *
def opsizer(opsize,tokens,currentpc):
    op=tokens[0].lower()
    operands=tokens[1].split(",")
    if op=='reserve':
        n=int(operands[0])
        if (n<9):
              return n
        else:
              return 10
    elif op=='release':
        n=int(operands[0])
        if (n<9):
              return n
        else:
              return 8
    elif op=='db':
        if len(tokens)>=3 and tokens[2]=='dup':
              return int(tokens[1]) #tokens[1] because dup is separated from the count by a space
        else:
              return 1
    elif op=='include':
        if operands[0].lower().startswith('lcc1802prolo'):
            return 3
        else:
            if operands[0].startswith('lcc1802epilo'):
                epiloglocation=currentpc
            return 0
    elif op in ['ld2','ld1','lda2','st2','st1','ld4','st4']: #ops that can be offset or direct storage refs
    	 #print operands
         if operands[1].lower()=="'o'": #offset/index
            return opsize*-1 #returns the whole value
         else:
            return (opsize*-1)-2 #direct op is 2 smaller
    elif op in ['shl2i','shri2i','shlu2i','shri2i','shru2i','shl4i','shri4i']:
         return int(operands[1])*-1*opsize
    elif op in ['incm','decm']:
         return int(operands[1])*-1*opsize
    elif op=='align':
        boundary=int(operands[0])
        if (currentpc%boundary)==0:
            return 0
        else:
            return boundary-(currentpc%boundary)
    else:
        print '**************oops',tokens,opsize
        x = raw_input("Press Enter to continue")
       
            
        
    return 999
    
def process(tokens,currentpc):
    global opdefs
    try:
        #print 'processing ',tokens,opdefs[tokens[0]],currentpc
        opsize=opsizes[tokens[0].lower()]
    except:
        print 'process oops', tokens
        print tokens[0],opsizes
        x = raw_input("Press Enter to continue")

    if opsize>=0:
        thisopsize=opsize
    else:
        thisopsize=opsizer(opsize,tokens,currentpc)
    #print tokens[0],opsize,thisopsize
    return thisopsize
