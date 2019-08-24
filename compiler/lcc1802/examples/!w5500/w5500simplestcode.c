//14-11-26 routines to address the wiznet w5500
//14-11-27 switched to single read & write routines
//14-12-8 wrapper routines for reading and writing commands and registers

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
  wizWrite(SIPR,WIZNET_WRITE_COMMON,ip_addr,4);// Set the Wiznet W5100 IP Address
}
void socket0_init(){ //initialize socket 0 for http server
	wizCmd(CR_CLOSE); //make sure port is closed
	wizSetCtl8(SnIR,0xFF); //reset interrupt reg
	wizSetCtl8(SnMR,MR_TCP); //set mode register to tcp
	wizSetCtl16(SnPORT,80); //set tcp port to 80
	wizCmd(CR_OPEN); //open the port
	wizCmd(CR_LISTEN); //listen for a conection
}

unsigned int send0(unsigned char *buf,unsigned int buflen){
    unsigned int timeout,txsize,txfree;
    unsigned char crsend=CR_SEND,crreadback;
	unsigned int txwr;
    if (buflen <= 0) return 0; //make sure there is something to send
    //make sure there is room in the transmit buffer for what we want to send
    txfree=wizGetCtl16(SnTX_FSR); //this is the size of the available buffer area
    timeout=0;
    while (txfree < buflen) {
      delay(1);
     txfree=wizGetCtl16(SnTX_FSR);
     if (timeout++ > 1000) {// Timeout for approx 1 sec
       	printf("TX Free Size Error!\n");
		wizCmd(CR_DISCON);// Disconnect the connection
       	return 0;
     }
   }
	//space is available so we will send the buffer
   	txwr=wizGetCtl16(SnTX_WR);  // Read the Tx Write Pointer
   	wizWrite(txwr,WIZNET_WRITE_S0TX,buf, buflen); //write the outgoing data to the transmit buffer
   	wizSetCtl16(SnTX_WR,txwr+buflen);//update the buffer pointer
	wizCmd(CR_SEND); // Now Send the SEND command which tells the wiznet the pointer is updated
    return 1;
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
