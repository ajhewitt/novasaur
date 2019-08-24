//15-08-21 routines to address the wiznet w5500 for multiple sockets
//15-08-21 derived from w5500simplestcode.c
//         X appended to socket-specific routines and unsigned char whichsocket added as first parameter

void wizWriteX(unsigned char whichsocket, unsigned int addr, unsigned char opcode, void * data, unsigned int len){
//variable length write to the wiznet W5500
//opcode is SSSx x100
// SSS is socket #, xx is 00 for common area, 01 for socket register, 10 for socket tx buffer, 11 for socket rx buffer
  enablewiz();   			// Activate the CS pin
  spiSendN((unsigned char *)&addr,2);
  spiSend(opcode||(whichsocket<<5));   		// Send Wiznet Write OpCode
  spiSendN(data,len);		//Send the payload
  disablewiz();				// make CS pin not active
}

void wizReadX(unsigned char whichsocket,unsigned int addr,unsigned char opcode, void * data, unsigned int len){
//variable length read from the wiznet w5500
//opcode is SSSx x000
// SSS is socket #, xx is 00 for common area, 01 for socket register, 10 for socket tx buffer, 11 for socket rx buffer
  enablewiz();   			// Activate the CS pin
  spiSendN((unsigned char *)&addr,2);
  spiSend(opcode||(whichsocket<<5));   		// Send Wiznet Read OpCode
  spiReceiveN(data,len);	// Send the data byte
  disablewiz();				// make CS pin not active
}
void wizCmdX(unsigned char whichsocket,unsigned char cmd){ //send a command to socket 0 and wait for completion
	wizWriteX(whichsocket,SnCR,WIZNET_WRITE_S0R,&cmd,1); //send the command
	while(wizReadX(whichsocket,SnCR,WIZNET_READ_S0R,&cmd,1),cmd); //wait til command completes
}
void wizSetCtl8X(unsigned char whichsocket,unsigned int ctlreg, unsigned char val){//write to a socket 0 control register
	wizWriteX(whichsocket,ctlreg, WIZNET_WRITE_S0R,&val,1);
}
unsigned char wizGetCtl8X(unsigned char whichsocket,unsigned int ctlregaddr){
  unsigned char regval; //spot to hold the register contents
  wizReadX(whichsocket,ctlregaddr,WIZNET_READ_S0R,&regval,1);
  return regval;
}
void wizSetCtl16X(unsigned char whichsocket,unsigned int ctlregaddr, unsigned int ctlregvalue){
  wizWriteX(whichsocket,ctlregaddr,WIZNET_WRITE_S0R,(unsigned char *) &ctlregvalue,2);
}
unsigned int wizGetCtl16X(unsigned char whichsocket,unsigned int ctlregaddr){
  union WReg regval; //spot to hold the register contents
  wizReadX(whichsocket,ctlregaddr,WIZNET_READ_S0R,regval.c,2);
  return regval.i;
}
void wiz_Init(unsigned char ip_addr[]){// Ethernet Setup
  wizWriteX(0,SIPR,WIZNET_WRITE_COMMON,ip_addr,4);// Set the Wiznet W5100 IP Address
}
void socketX_init(unsigned char whichsocket){ //initialize socket 0 for http server
	wizCmdX(whichsocket,CR_CLOSE); //make sure port is closed
	wizSetCtl8X(whichsocket,SnIR,0xFF); //reset interrupt reg
	wizSetCtl8X(whichsocket,SnMR,MR_TCP); //set mode register to tcp
	wizSetCtl16X(whichsocket,SnPORT,80); //set tcp port to 80
	wizCmdX(whichsocket,CR_OPEN); //open the port
	wizCmdX(whichsocket,CR_LISTEN); //listen for a conection
}

unsigned int sendX(unsigned char whichsocket,unsigned char *buf,unsigned int buflen){
    unsigned int timeout,txsize,txfree;
    unsigned char crsend=CR_SEND,crreadback;
	unsigned int txwr;
    if (buflen <= 0) return 0; //make sure there is something to send
    //make sure there is room in the transmit buffer for what we want to send
    txfree=wizGetCtl16X(whichsocket,SnTX_FSR); //this is the size of the available buffer area
    timeout=0;
    while (txfree < buflen) {
      delay(1);
     txfree=wizGetCtl16X(whichsocket,SnTX_FSR);
     if (timeout++ > 1000) {// Timeout for approx 1 sec
       	printf("TX Free Size Error!\n");
		wizCmdX(whichsocket,CR_DISCON);// Disconnect the connection
       	return 0;
     }
   }
	//space is available so we will send the buffer
   	txwr=wizGetCtl16X(whichsocket,SnTX_WR);  // Read the Tx Write Pointer
   	wizWriteX(whichsocket,txwr,WIZNET_WRITE_S0TX,buf, buflen); //write the outgoing data to the transmit buffer
   	wizSetCtl16X(whichsocket,SnTX_WR,txwr+buflen);//update the buffer pointer
	wizCmdX(whichsocket,CR_SEND); // Now Send the SEND command which tells the wiznet the pointer is updated
    return 1;
}

unsigned int recvX(unsigned char whichsocket,unsigned char *buf,unsigned int buflen){
	unsigned int rxrd;
    if (buflen <= 0) return 1;
    if (buflen > MAX_BUF)	// If the request size > MAX_BUF,just truncate it
        buflen=MAX_BUF - 2;
    rxrd = wizGetCtl16X(whichsocket,SnRX_RD); // get the address where the wiznet is holding the data
	wizReadX(whichsocket,rxrd,WIZNET_READ_S0RX,buf,buflen); //read the data
    *(buf+buflen)='\0';        // terminate string
    return 1;
}

void flushX(unsigned char whichsocket,unsigned int rsize){ //this just gets rid of data that i don't want to process
	unsigned int rxrd;
	if (rsize>0){
  		rxrd=wizGetCtl16X(whichsocket,SnRX_RD); //retrieve read data pointer
  		wizSetCtl16X(whichsocket,SnRX_RD,rxrd+rsize); //replace read data pointer
		wizCmdX(whichsocket,CR_RECV); //tell the wiznet we`ve retrieved the data
	}
}
