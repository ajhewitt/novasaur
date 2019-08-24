//14-11-26 routines to address the wiznet w5500
//14-11-27 switched to single read & write routines
//14-12-8 wrapper routines
//15-02-19 set gateway ip to same as supplied ip but .1 in the, check & reset interrupt status
//15-02-28 fixed logic error in congratulate, was printing wrong high score.  removed chatter around interrupt reset
void wizWrite(unsigned int addr, unsigned char opcode, void * data, unsigned int len){
//variable length write to the wiznet W5500
//opcode is xxxx x100
// xxxxx is 00000 for common area, 00001 for socket 0 register, 00010 for socket 0 tx buffer
  enablewiz();   			// Activate the CS pin
  spiSendN((unsigned char *)&addr,2);
  spiSend(opcode);   		// Send Wiznet Write OpCode
  spiSendN(data,len);		//Send the payload
  disablewiz();				// make CS pin not active
}

void wizRead(unsigned int addr,unsigned char opcode, void * data, unsigned int len){
//variable length read from the wiznet w5500
//opcode is xxxx x000
// xxxxx is 00000 for common area, 00001 for socket 0 register, 00011 for socket 0 rx buffer
  enablewiz();   			// Activate the CS pin
  spiSendN((unsigned char *)&addr,2);
  spiSend(opcode);   		// Send Wiznet Read OpCode
  spiReceiveN(data,len);	// Send the data byte
  disablewiz();				// make CS pin not active
}
void wizCmd(unsigned char cmd){ //send a command to socket 0 and wait for completion
	wizWrite(SnCR,WIZNET_WRITE_S0R,&cmd,1); //send the command
	while(wizRead(SnCR,WIZNET_READ_S0R,&cmd,1),cmd); //wait til command completes
}
void wizSetCtl8(unsigned int ctlreg, unsigned char val){//write to a socket 0 control register
	wizWrite(ctlreg, WIZNET_WRITE_S0R,&val,1);
}
unsigned char wizGetCtl8(unsigned int ctlregaddr){
  unsigned char regval; //spot to hold the register contents
  wizRead(ctlregaddr,WIZNET_READ_S0R,&regval,1);
  return regval;
}
void wizSetCtl16(unsigned int ctlregaddr, unsigned int ctlregvalue){
  wizWrite(ctlregaddr,WIZNET_WRITE_S0R,(unsigned char *) &ctlregvalue,2);
}
unsigned int wizGetCtl16(unsigned int ctlregaddr){
  union WReg regval; //spot to hold the register contents
  wizRead(ctlregaddr,WIZNET_READ_S0R,regval.c,2);
  return regval.i;
}
void wiz_Init(unsigned char ip_addr[]){// Ethernet Setup
  unsigned char mac_addr[] = {0xDE, 0xAD, 0xBE, 0xE5, 0xFE, 0xED};
  unsigned char sub_mask[] = {255,255,255,0};
  unsigned char gtw_addr[] = {192,168,1,1};
  unsigned char readback_ip[] = {1,2,3,4};
  unsigned char bsz0=0, bsz2=2, bsz4=4;	//
  wizWrite(SHAR,WIZNET_WRITE_COMMON,mac_addr,6);// Set the MAC address - Source Address Register
  delay(1);
  wizWrite(SUBR,WIZNET_WRITE_COMMON,sub_mask,4);// Set the Wiznet W5100 Sub Mask Address
  delay(1);
  wizWrite(SIPR,WIZNET_WRITE_COMMON,ip_addr,4);// Set the Wiznet W5100 IP Address
  delay(1);
  wizWrite(GAR,WIZNET_WRITE_COMMON,ip_addr,3);//set the wiznet gateway address register same as our ip
  wizWrite(GAR+3,WIZNET_WRITE_COMMON,gtw_addr+3,1);//set the wiznet gateway address register same as our ip except last byte
  delay(1);

  wizRead(SIPR,WIZNET_READ_COMMON,readback_ip,4); //read back the IP to make sure it "took"
  printf("Done Wiznet W5500 Initialization on IP address %d.%d.%d.%d\n",readback_ip[0],readback_ip[1],readback_ip[2],readback_ip[3]);
  wizRead(GAR,WIZNET_READ_COMMON,readback_ip,4); //read back the Gateway IP to make sure it "took"
  printf("Gateway Address %d.%d.%d.%d\n\n",readback_ip[0],readback_ip[1],readback_ip[2],readback_ip[3]);
}
void socket0_init(){ //initialize socket 0 for http server
	wizCmd(CR_CLOSE); //make sure port is closed
	wizSetCtl8(SnIR,0xFF); //reset interrupt reg
	wizSetCtl8(SnMR,MR_TCP); //set mode register to tcp
	wizSetCtl16(SnPORT,80); //set tcp port to 80
	wizCmd(CR_OPEN); //open the port
	wizCmd(CR_LISTEN); //listen for a conection
}


long getip(){ //retrieve the requester's ip and return it as a long
	union IPaddr thisip;
	wizRead(SnDIPR,WIZNET_READ_S0R,thisip.c,4);
	return thisip.l;
}


#define sendlit(x) send0((unsigned char*)x,sizeof(x)-1)
#define sendconst(x) send0((unsigned char*)x,sizeof(x)-1)

unsigned int send0(unsigned char *buf,unsigned int buflen){
    unsigned int timeout,txsize,txfree;
    unsigned char intval;
	unsigned int txwr;
	//printf("send0 %d\n",buflen);
    if (buflen <= 0) return 0;
    // Make sure the TX Free Size Register shows enough room
    txfree=wizGetCtl16(SnTX_FSR);
	//printf("free %d\n",txfree);
    timeout=0;
    while (txfree < buflen) {
      delay(1);
     txfree=wizGetCtl16(SnTX_FSR);
     // Timeout for approx 1000 ms
     if (timeout++ > 1000) {
       	printf("TX Free Size Error!\n");
		wizCmd(CR_DISCON);// Disconnect the connection
       	return 0;
     }
   }


   	txwr=wizGetCtl16(SnTX_WR);  // Read the Tx Write Pointer
   	wizWrite(txwr,WIZNET_WRITE_S0TX,buf, buflen); //write the outgoing data to the transmit buffer
   	wizSetCtl16(SnTX_WR,txwr+buflen);//update the buffer pointer
	wizCmd(CR_SEND); // Now Send the SEND command which tells the wiznet the pointer is updated
	intval=wizGetCtl8(SnIR); //get the interrupt status
	//printf ("post send interrupt status is %cx\n",intval);
	while((intval&0x10)!=0x10){ //wait for sendok status
		intval=wizGetCtl8(SnIR); //get the interrupt status
	}
	wizSetCtl8(SnIR,0x15);//reset interrupt status
	//printf("Interrupt register reset\n");
    return 1;
}
int send0s(char* what){
	return send0((unsigned char *)what,strlen(what));
}
void sendnak(){
	sendlit("HTTP/1.1 404 Not Found\r\n\r\n"); 	// Now Send the HTTP Response
}

void sendack(){
	sendlit("HTTP/1.0 200 OK\r\n\r\n"); 	// Now Send the HTTP Response
}

unsigned int recv0(unsigned char *buf,unsigned int buflen){
	unsigned int rxrd;
    if (buflen <= 0) return 1;
    if (buflen > MAX_BUF)	// If the request size > MAX_BUF,just truncate it
        buflen=MAX_BUF - 2;
    rxrd = wizGetCtl16(SnRX_RD); // get the address where the wiznet is holding the data
	wizRead(rxrd,WIZNET_READ_S0RX,buf,buflen); //read the data
    *(buf+buflen)='\0';        // terminate string
    return 1;
}

void flush(unsigned int rsize){ //this just gets rid of data that i don't want to process
	unsigned int rxrd;
	if (rsize>0){
  		rxrd=wizGetCtl16(SnRX_RD); //retrieve read data pointer
  		wizSetCtl16(SnRX_RD,rxrd+rsize); //replace read data pointer
		wizCmd(CR_RECV); //tell the wiznet we`ve retrieved the data
	}
}
