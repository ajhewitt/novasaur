//function(..) module saved jan 1 2013 as part of prep for scrt integration
static void function(Symbol f, Symbol caller[], Symbol callee[], int ncalls) {
        int i, saved, sizefsave, sizeisave, varargs;
        Symbol r, argregs[NUM_ARG_REGS];

        usedmask[0] = usedmask[1] = 0;
        freemask[0] = freemask[1] = ~(unsigned)0;
        offset = maxoffset = maxargoffset = 0;
        for (i = 0; callee[i]; i++) //find last argument
                ;
        varargs = variadic(f->type) //see if variable arguments by type or by name of final argument
                || i > 0 && strcmp(callee[i-1]->name, "va_alist") == 0; 
        for (i = 0; callee[i]; i++) {  //for each argument
                Symbol p = callee[i];
                Symbol q = caller[i];
                assert(q);
                offset = roundup(offset, q->type->align); //calculate the offset from the caller's sp
                p->x.offset = q->x.offset = offset;
                p->x.name = q->x.name = stringd(offset);
                r = argreg(i, offset, optype(ttob(q->type)), q->type->size, optype(ttob(caller[0]->type)));
                if (i < NUM_ARG_REGS)
                        argregs[i] = r;
                offset = roundup(offset + q->type->size, 2); //i dunno
                if (varargs)
                        p->sclass = AUTO;  //variable args are always auto?
                else if (r && ncalls == 0 &&  //I dunno
                         !isstruct(q->type) && !p->addressed &&
                         !(isfloat(q->type) && r->x.regnode->set == IREG)) {
                        p->sclass = q->sclass = REGISTER;
                        askregvar(p, r);
                        assert(p->x.regnode && p->x.regnode->vbl == p);
                        q->x = p->x;
                        q->type = p->type;
                }
                else if (askregvar(p, rmap(ttob(p->type)))
                         && r != NULL
                         && (isint(p->type) || p->type == q->type)) {
                        assert(q->sclass != REGISTER);
                        p->sclass = q->sclass = REGISTER;
                        q->type = p->type;
                }
        }
        assert(!caller[i]);  //done with arguments, their individual offsets and maxargoffset have been set
        offset = 0;
        gencode(caller, callee);
        if (ncalls) //prepare to save return address if necessary(i.e. we do calls of our own)
                usedmask[IREG] |= ((unsigned)1)<<REG_RETADDR;
        usedmask[IREG] &= INT_CALLEE_SAVE;  //limit saving to those we're responsible for
        usedmask[FREG] &= 0xfff00000;
        maxargoffset = roundup(maxargoffset, usedmask[FREG] ? 8 : 2);
        if (ncalls && maxargoffset < NUM_ARG_REGS*2)
                maxargoffset = NUM_ARG_REGS*2;
        sizefsave = 4*bitcount(usedmask[FREG]); //space needed to save the float regs
        sizeisave = 2*bitcount(usedmask[IREG]);  //space needed to save the int regs
        framesize = roundup(maxargoffset + sizefsave //space for outgoing arguments, space for saving floats, 
                + sizeisave + maxoffset, 2);  //space for saving ints, space for locals
        //segment(CODE);
        //printf("\talign 16\n");
        printf("%s:\n", f->x.name);
        i = maxargoffset + sizefsave - framesize;  //I dunno but it's -v and it's never used!
        if (framesize > 0)
                print("\talu2I sp,sp,%d,smi,smbi\n", framesize);
        saved = maxargoffset;  /space needed for outgoing arguments
        for (i = 20; i <= 30; i += 2)  //save the floats
                if (usedmask[FREG]&(3<<i)) {
                        print("s.d rf%d,%d(sp); function\n", i, saved);
                        saved += 8;
                }

        for (i = 0; i < NUM_IREGS; i++)  //save the regs
                if (usedmask[IREG]&(1<<i)) {
                        print("\tst2 r%d,'O',sp,(%d); sw r%d,%d(sp)\n", i, saved,i,saved);
                        saved += 2;
                }
        for (i = 0; i < NUM_ARG_REGS && callee[i]; i++) {  //maybe assign in-function regs for arguments?  store them if needed?
                r = argregs[i];
                if (r && r->x.regnode != callee[i]->x.regnode) {
                        Symbol out = callee[i];
                        Symbol in  = caller[i];
                        int rn = r->x.regnode->number;
                        int rs = r->x.regnode->set;
                        int tyin = ttob(in->type);

                        assert(out && in && r && r->x.regnode);
                        assert(out->sclass != REGISTER || out->x.regnode);
                        if (out->sclass == REGISTER
                        && (isint(out->type) || out->type == in->type)) {
                                int outn = out->x.regnode->number;
                                if (rs == FREG && tyin == F+sizeop(8))
                                        print("mov.d rf%d,rf%d\n", outn, rn);
                                else if (rs == FREG && tyin == F+sizeop(4))
                                        print("mov.s rf%d,rf%d\n", outn, rn);
                                else if (rs == IREG && tyin == F+sizeop(8))
                                        print("mtc1.d r%d,rf%d\n", rn,   outn);
                                else if (rs == IREG && tyin == F+sizeop(4))
                                        print("mtc1 r%d,rf%d\n",   rn,   outn);
                                else
                                        print("\tcpy2 r%d,r%d\n",    outn, rn);
                        } else {
                                int off = in->x.offset + framesize;
                                if (rs == FREG && tyin == F+sizeop(8))
                                        print("s.d rf%d,%d(sp)\n", rn, off);
                                else if (rs == FREG && tyin == F+sizeop(4))
                                        print("s.s rf%d,%d(sp)\n", rn, off);
                                else {
                                        int i, n = (in->type->size + 1)/2;
                                        for (i = rn; i < rn+n && i <= REG_LAST_ARG; i++)
                                                print("\tst2 r%d,'O',sp,(%d); sw r%d,%d(sp) \n", i, off + (i-rn)*2, i, off + (i-rn)*2);
                                }
                        }
                }
        }
        if (varargs && callee[i-1]) {  //saving variable argument regs?
                i = callee[i-1]->x.offset + callee[i-1]->type->size;
                for (i = roundup(i, 2)/2; i < NUM_ARG_REGS; i++)
                        print("\tst2 r%d,'O',sp,(%d);sw r%d,%d(sp)\n", REG_FIRST_ARG + i, framesize + 2*i, REG_FIRST_ARG + i, framesize + 2*i);
                }
        emitcode();
        saved = maxargoffset;
        for (i = 20; i <= 30; i += 2)  //restore floats
                if (usedmask[FREG]&(3<<i)) {
                        print("l.d rf%d,%d(sp)\n", i, saved);
                        saved += 8;
                }
        for (i = 0; i < NUM_IREGS; i++)  //restore ints
                if (usedmask[IREG]&(1<<i)) {
                        print("\tld2 r%d,'O',sp,(%d); r%d,%d(sp)\n", i, saved,i,saved);
                        saved += 2;
                }
        if (framesize > 0)
                print("\talu2I sp,sp,%d,adi,adci; addi sp,sp,%d\n", framesize,framesize);
        print("\tCretn\n\n");
}