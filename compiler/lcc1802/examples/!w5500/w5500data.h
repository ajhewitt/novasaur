//w5500data.h - defines for wiznet w5500 data structures

// Wiznet W5500 Op Codes
#define WIZNET_WRITE_COMMON 0x04 //opcode to write to one of the common block of registers
#define WIZNET_READ_COMMON 0x00	//opcode to wread one of the common block of registers
#define WIZNET_WRITE_S0R 0x0C  //(000 01 1 00) opcode to write to one of the socket 0 registers
#define WIZNET_READ_S0R 0x08   //(000 01 0 00) opcode to read one of the socket 0 registers
#define WIZNET_WRITE_S0TX 0x14 //(000 10 1 00) opcode to write to the socket 0 transmit buffer
#define WIZNET_READ_S0RX 0x18  //(000 11 0 00) opcode to read from the socket 0 receive buffer

// Wiznet W5500 Register Addresses
#define MR     0x0000    // Mode
#define GAR    0x0001    // Gateway IP address
#define SUBR   0x0005    // Subnet mask address
#define SHAR   0x0009    // Source MAC address
#define SIPR   0x000F    // Source IP address
#define IR     0x0015    // Interrupt
#define IMR    0x0016    // Interrupt Mask
#define RTR    0x0019    // Timeout address
#define RCR    0x001B    // Retry count
#define UIPR   0x0028    // Unreachable IP address in UDP mode
#define UPORT  0x002C    // Unreachable Port address in UDP mode
//W5500 Socket Registers follow
#define SnMR        0x0000        // Mode
#define SnCR        0x0001        // Command
#define SnIR        0x0002        // Interrupt
#define SnSR        0x0003        // Status
#define SnPORT      0x0004        // Source Port
#define SnDHAR      0x0006      // Destination Hardw Addr
#define SnDIPR      0x000C      // Destination IP Addr
#define SnDPORT     0x0010        // Destination Port
#define SnMSSR      0x0012        // Max Segment Size
#define SnPROTO     0x0014        // Protocol in IP RAW Mode
#define SnTOS       0x0015        // IP TOS
#define SnTTL       0x0016        // IP TTL
#define SnRX_BSZ    0x001E        // RX Buffer Size
#define SnTX_BSZ    0x001F        // TX Buffer Size
#define SnTX_FSR    0x0020        // TX Free Size
#define SnTX_RD     0x0022        // TX Read Pointer
#define SnTX_WR     0x0024        // TX Write Pointer
#define SnRX_RSR    0x0026        // RX RECEIVED SIZE REGISTER
#define SnRX_RD     0x0028        // RX Read Pointer
#define SnRX_WR     0x002A        // RX Write Pointer (supported?
// S0_MR values
#define MR_CLOSE	  0x00    // Unused socket
#define MR_TCP		  0x01    // TCP
#define MR_UDP		  0x02    // UDP
#define MR_IPRAW	  0x03	  // IP LAYER RAW SOCK
#define MR_MACRAW	  0x04	  // MAC LAYER RAW SOCK
#define MR_PPPOE	  0x05	  // PPPoE
#define MR_ND		  0x20	  // No Delayed Ack(TCP) flag
#define MR_MULTI	  0x80	  // support multicating
// S0_CR values
#define CR_OPEN          0x01	  // Initialize or open socket
#define CR_LISTEN        0x02	  // Wait connection request in tcp mode(Server mode)
#define CR_CONNECT       0x04	  // Send connection request in tcp mode(Client mode)
#define CR_DISCON        0x08	  // Send closing reqeuset in tcp mode
#define CR_CLOSE         0x10	  // Close socket
#define CR_SEND          0x20	  // Update Tx memory pointer and send data
#define CR_SEND_MAC      0x21	  // Send data with MAC address, so without ARP process
#define CR_SEND_KEEP     0x22	  // Send keep alive message
#define CR_RECV          0x40	  // Update Rx memory buffer pointer and receive data
// S0_SR values
#define SOCK_CLOSED      0x00     // Closed
#define SOCK_INIT        0x13	  // Init state
#define SOCK_LISTEN      0x14	  // Listen state
#define SOCK_SYNSENT     0x15	  // Connection state
#define SOCK_SYNRECV     0x16	  // Connection state
#define SOCK_ESTABLISHED 0x17	  // Success to connect
#define SOCK_FIN_WAIT    0x18	  // Closing state
#define SOCK_CLOSING     0x1A	  // Closing state
#define SOCK_TIME_WAIT	 0x1B	  // Closing state
#define SOCK_CLOSE_WAIT  0x1C	  // Closing state
#define SOCK_LAST_ACK    0x1D	  // Closing state
#define SOCK_UDP         0x22	  // UDP socket
#define SOCK_IPRAW       0x32	  // IP raw mode socket
#define SOCK_MACRAW      0x42	  // MAC raw mode socket
#define SOCK_PPPOE       0x5F	  // PPPOE socket

#define TCP_PORT         80       // TCP/IP Port
