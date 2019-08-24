//14-07-22 reduced to a single routine to find a slot or make one
int getipslot(union IPaddr whichip){//see if this ip is registered and register it if not
	int i=0, tslot;
	while(whichip.l!=regip[i].l && i<numslots){
		i++;
	}
	if (i<numslots){
		return i;
	}else{
		tslot=nextslot++;
		if (nextslot>=numslots){
			nextslot=0;
		}
		regip[tslot]=thisip; //register the ip
		strcpy((char*)secrets[tslot],"999");//supply a dummy secret on initialization
		ipgames[tslot]=0; ipturns[tslot]=0;//reset stats
		printf("%d,%s\n",tslot,secrets[tslot]);
		return tslot;
	}
}
