int i;
void main(){
	i=intfunc();
}
//0:CALLI2(ADDRGP2(intfunc))  	Ccall 1:ADDRGP2(intfunc)  _intfunc


//2:LOAD(CALLI2(ADDRGP2(intfunc)))  	cpy2 R11,R3:CALLI2(ADDRGP2(intfunc))  15  ;LOADI2(reg)*

//4:ASGNI2(VREGP(1), LOAD(CALLI2(ADDRGP2(intfunc))))
//5:INDIRI2(VREGP(1))

//6:ASGNI2(ADDRGP2(i), INDIRI2(VREGP(1)))  	st2 R7:INDIRI2(VREGP(1))  11, 8:ADDRGP2(i)  'D',(9:ADDRGP2(i)  _i ),0 ; ASGNI2(addr,reg)*;

//10:LABELV(1)  L1: