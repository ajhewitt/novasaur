//14-07-18 wizcode.h - header for routines to address the wiznet w5100
void wiz_WriteN(unsigned int offaddr,unsigned char *data, unsigned int N)
{
  //printf("\nwiz_WriteN(%x,%s,%d) ",offaddr,data,N);
  SPINsequence.opcode=WIZNET_WRITE_OPCODE; //prep for sequence of writes
  while(N>0){//for all the bytes to be transferred
  	SPINsequence.realaddr=TXBUFADDR+(offaddr&TX_BUF_MASK);
  	SPINsequence.data=*data;
  	//p4hex(&SPINsequence.opcode);
  	enablewiz();   			// Activate the CS pin
  	spiSendN(&SPINsequence.opcode,4);
  	disablewiz();				// make CS pin not active
  	offaddr++;data++;N--;
  }
}
void wiz_WriteNf(unsigned int offaddr,unsigned char *data, unsigned int N)
{
  //printf("\nwiz_WriteN(%x,%s,%d) ",offaddr,data,N);
  SPINsequence.select=PIN4&selectmask;
  SPINsequence.deselect=PIN4&deselectmask;
  SPINsequence.opcode=WIZNET_WRITE_OPCODE; //prep for sequence of writes
  asm("	ldaD memaddr,_SPINsequence+4\n"	//point to the data element in the work area
  	"	sex memaddr\n");	//prepare to do output from there
  while(N>0){//for all the bytes to be transferred
  	//SPINsequence.data=*data++;
  	asm("	lda	R13\n"	//pick up a byte of data
   		"	stxd\n");	//store it and back up to the address

  	//SPINsequence.realaddr=TXBUFADDR+(offaddr&TX_BUF_MASK);
  	asm("	glo R12\n"	//low byte of address doesn't change
  		"	stxd\n" //put it in place and back up
  		"	ghi R12\n"	//offaddr is in Reg 12
  		"	ani 2047>>8\n" //wrap around if needed
  		"	ori 16384>>8\n" //keep in the buffer area
  		"	stxd\n"	//now points to the write opcode
  		"	dec memaddr\n"); //back to the beginning of the work area

  	asm("	out 4\n"		//select the shield
  		"	out 6\n	out 6\n	out 6\n	out 6\n" //output the payload
  		"	out 4\n");		//deselect the shield
  	asm("	dec memaddr\n	dec memaddr\n");//point back to the data byte
  	offaddr++;N--;
  }
  asm("	sex 2\n");		//reset the X register
}

void wiz_Write(unsigned int addr,unsigned char data)
{
  enablewiz();   			// Activate the CS pin
  spiSend(WIZNET_WRITE_OPCODE);   // Send Wiznet W5100 Write OpCode
  spiSend(addr >>8); 		// Send Wiznet W5100 Address High Byte
  spiSend(addr & 0x00FF);	// Send Wiznet W5100 Address Low Byte
  spiSend(data);			// Send the data byte
  disablewiz();				// make CS pin not active
}
unsigned char wiz_Read(unsigned int addr)
{
  unsigned char value; 	//data returned from spi transmission
  enablewiz();   		// Activate the CS pin
  spiSend(WIZNET_READ_OPCODE);   //Send Wiznet W5100 Write OpCode
  spiSend(addr >>8);	// Send Wiznet W5100 Address High Byte
  spiSend(addr & 0x00FF);  // Send Wiznet W5100 Address Low Byte
  value=spixfer(0xff);	// Send Dummy transmission to read the data
  disablewiz();			// make CS pin inactive
  return(value);
}

void wiz_Init(unsigned char ip_addr[]){// Ethernet Setup
  unsigned char mac_addr[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
  unsigned char sub_mask[] = {255,255,255,0};
  unsigned char gtw_addr[] = {192,168,0,1};
  wiz_Write(MR,0x80);   // setting bit 7 of the mode register does a software reset of the w5100
  delay(1);
  //set the wiznet gateway address register
  wiz_Write(GAR + 0,gtw_addr[0]); wiz_Write(GAR + 1,gtw_addr[1]);
  wiz_Write(GAR + 2,gtw_addr[2]); wiz_Write(GAR + 3,gtw_addr[3]);
  delay(1);
  // Set the Wiznet W5100 MAC address - Source Address Register (SAR): 0x0009 to 0x000E
  wiz_Write(SAR + 0,mac_addr[0]); wiz_Write(SAR + 1,mac_addr[1]);
  wiz_Write(SAR + 2,mac_addr[2]); wiz_Write(SAR + 3,mac_addr[3]);
  wiz_Write(SAR + 4,mac_addr[4]); wiz_Write(SAR + 5,mac_addr[5]);
  delay(1);
  // Set the Wiznet W5100 Sub Mask Address (SUBR): 0x0005 to 0x0008
  wiz_Write(SUBR + 0,sub_mask[0]); wiz_Write(SUBR + 1,sub_mask[1]);
  wiz_Write(SUBR + 2,sub_mask[2]); wiz_Write(SUBR + 3,sub_mask[3]);
  delay(1);
  // Set the Wiznet W5100 IP Address (SIPR): 0x000F to 0x0012
  wiz_Write(SIPR + 0,ip_addr[0]); wiz_Write(SIPR + 1,ip_addr[1]);
  wiz_Write(SIPR + 2,ip_addr[2]); wiz_Write(SIPR + 3,ip_addr[3]);
  delay(1);
  // Set the Wiznet W5100 RX and TX Memory Size, we use 2KB for Rx/Tx 4 channels
  wiz_Write(RMSR,0x55);
  wiz_Write(TMSR,0x55);
  printf("Done Wiznet W5100 Initialization on IP address %d.%d.%d.%d\n\n",wiz_Read(SIPR + 0),wiz_Read(SIPR + 1),wiz_Read(SIPR + 2),wiz_Read(SIPR + 3));
}

void socket0_init(){ //initialize socket 0 for http server
	wiz_Write(S0_MR,MR_TCP);	//set mode register to tcp
	wiz_Write(S0_PORT,((TCP_PORT & 0xFF00) >> 8 ));	//set tcp port to 0050
	wiz_Write(S0_PORT + 1,(TCP_PORT & 0x00FF));
	wiz_Write(S0_CR,CR_OPEN);                   // Open Socket
	delay(10);
    wiz_Write(S0_CR,CR_LISTEN);					//listen to socket
}

void disconnect0(){
   wiz_Write(S0_CR,CR_DISCON); 	//send disconnect command
   while(wiz_Read(S0_CR));		// Wait for Disconecting Process
}

void close0(){

   wiz_Write(S0_CR,CR_CLOSE);    // Send Close Command
   while(wiz_Read(S0_CR));   	// Wait until the S0_CR is clear
}

unsigned int recv0(unsigned char *buf,unsigned int buflen){
    unsigned int ptr,offaddr,realaddr;

    if (buflen <= 0) return 1;

    if (buflen > MAX_BUF)	// If the request size > MAX_BUF,just truncate it
        buflen=MAX_BUF - 2;
    ptr = wiz_Read(S0_RX_RD);     // Read the Rx Read Pointer
    offaddr = (((ptr & 0x00FF) << 8 ) + wiz_Read(S0_RX_RD + 1));
		while(buflen) {//receive individual bytes into the buffer
		  buflen--;
		  realaddr=RXBUFADDR + (offaddr & RX_BUF_MASK);
		  *buf = wiz_Read(realaddr);
		  offaddr++;
		  buf++;
		}
    *buf='\0';        // terminate string

    return 1;
}
void flush(int rsize){ //flush the receive buffer
    unsigned int ptr,offaddr;
    ptr = wiz_Read(S0_RX_RD);   // Read the Rx Read Pointer
    offaddr = (((ptr & 0x00FF) << 8 ) + wiz_Read(S0_RX_RD + 1));
	offaddr+=rsize;				//how much to skip
    // Increase the S0_RX_RD value, so it point to the next receive
    wiz_Write(S0_RX_RD,(offaddr >> 8) );
    wiz_Write(S0_RX_RD + 1,(offaddr & 0x00FF));

    wiz_Write(S0_CR,CR_RECV);	// Now Send the RECV command
    delay(5);    				// Wait for Receive Process
}
unsigned int recv_size(void){
  return ((wiz_Read(S0_RX_RSR) & 0x00FF) << 8 ) + wiz_Read(S0_RX_RSR + 1);
}
//send0 may be taking a very long time to send single characters.
unsigned int send0aswas(unsigned char *buf,unsigned int buflen){
    unsigned int ptr,offaddr,realaddr,txsize,timeout;
	//printf("send0 %d\n",buflen);
    if (buflen <= 0) return 0;
    // Make sure the TX Free Size Register is available
    txsize=wiz_Read(SO_TX_FSR);
    txsize=(((txsize & 0x00FF) << 8 ) + wiz_Read(SO_TX_FSR + 1));
    timeout=0;
    while (txsize < buflen) {
      delay(1);
     txsize=wiz_Read(SO_TX_FSR);
     txsize=(((txsize & 0x00FF) << 8 ) + wiz_Read(SO_TX_FSR + 1));
     // Timeout for approx 1000 ms
     if (timeout++ > 1000) {
       printf("TX Free Size Error!\n");
       // Disconnect the connection
       disconnect0();
       return 0;
     }
   }

   // Read the Tx Write Pointer
   ptr = wiz_Read(S0_TX_WR);
   offaddr = (((ptr & 0x00FF) << 8 ) + wiz_Read(S0_TX_WR + 1));

	wiz_WriteN(offaddr,buf,buflen);
	offaddr+=buflen;

    // Increase the S0_TX_WR value, so it point to the next transmit
    wiz_Write(S0_TX_WR,(offaddr & 0xFF00) >> 8 );
    wiz_Write(S0_TX_WR + 1,(offaddr & 0x00FF));

    // Now Send the SEND command
    wiz_Write(S0_CR,CR_SEND);
	//printf("W\n");
    // Wait for Sending Process
    while(wiz_Read(S0_CR));
	//printf("D\n");

    return 1;
}
unsigned int send0(unsigned char *buf,unsigned int buflen){
    unsigned int ptr,offaddr,realaddr,txsize,timeout;
	//printf("send0 %d\n",buflen);
    if (buflen <= 0) return 0;
    // Make sure the TX Free Size Register is available
    txsize=wiz_Read(SO_TX_FSR);
    txsize=(((txsize & 0x00FF) << 8 ) + wiz_Read(SO_TX_FSR + 1));
    timeout=0;
    while (txsize < buflen) {
      delay(1);
     txsize=wiz_Read(SO_TX_FSR);
     txsize=(((txsize & 0x00FF) << 8 ) + wiz_Read(SO_TX_FSR + 1));
     // Timeout for approx 1000 ms
     if (timeout++ > 1000) {
       printf("TX Free Size Error!\n");
       // Disconnect the connection
       disconnect0();
       return 0;
     }
   }

   // Read the Tx Write Pointer
   ptr = wiz_Read(S0_TX_WR);
   offaddr = (((ptr & 0x00FF) << 8 ) + wiz_Read(S0_TX_WR + 1));

	wiz_WriteNf(offaddr,buf,buflen);
	offaddr+=buflen;

    // Increase the S0_TX_WR value, so it point to the next transmit
    wiz_Write(S0_TX_WR,(offaddr & 0xFF00) >> 8 );
    wiz_Write(S0_TX_WR + 1,(offaddr & 0x00FF));

    // Now Send the SEND command
    wiz_Write(S0_CR,CR_SEND);
	//printf("W\n");
    // Wait for Sending Process
    while(wiz_Read(S0_CR));
	//printf("D\n");

    return 1;
}
void sendnak(){
	sendlit("HTTP/1.1 404 Not Found\r\n\r\n"); 	// Now Send the HTTP Response
}

void sendack(){
	sendlit("HTTP/1.0 200 OK\r\n\r\n"); 	// Now Send the HTTP Response
}

int send0s(char* what){
	return send0((unsigned char *)what,strlen(what));
}

long getip(){ //retrieve the requester's ip and return it as a long
	union IPaddr thisip;
	thisip.c[0]=wiz_Read(S0_DIPR + 0);thisip.c[1]=wiz_Read(S0_DIPR + 1);thisip.c[2]=wiz_Read(S0_DIPR + 2);thisip.c[3]=wiz_Read(S0_DIPR + 3);
	return thisip.l;
}
