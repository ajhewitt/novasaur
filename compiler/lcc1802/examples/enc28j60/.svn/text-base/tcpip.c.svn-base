#include "net.h"
//typedef unsigned int word;
#define gPB buffer
#define PINGPATTERN 0x42
static byte tcpclient_src_port_l=1;
static byte tcp_fd; // a file descriptor, will be encoded into the port
static byte tcp_client_state;
static byte tcp_client_port_h;
static byte tcp_client_port_l;
static byte (*client_tcp_result_cb)(byte,byte,word,word);
 unsigned int (*client_tcp_datafill_cb)(byte);
#define TCPCLIENT_SRC_PORT_H 11
static byte www_fd;
 void (*client_browser_cb)(byte,word,word);
static char *client_additionalheaderline;
static const char *client_postval;
static char *client_urlbuf;
static const char *client_urlbuf_var;
static char *client_hoststr;
static void (*icmp_cb)(byte *ip);
static int16_t delaycnt=1;
static byte gwmacaddr[6];
static byte waitgwmac; // 0=wait, 1=first req no anser, 2=have gwmac, 4=refeshing but have gw mac, 8=accept an arp reply
#define WGW_INITIAL_ARP 1
#define WGW_HAVE_GW_MAC 2
#define WGW_REFRESHING 4
#define WGW_ACCEPT_ARP_REPLY 8
static word info_data_len;
static byte seqnum = 0xa; // my initial tcp sequence number

#define CLIENTMSS 550
#define TCP_DATA_START ((word)TCP_SRC_PORT_H_P+(gPB[TCP_HEADER_LEN_P]>>4)*4)

const char arpreqhdr[]  = { 0,1,8,0,6,4,0,1 };
const char iphdr[]  = { 0x45,0,0,0x82,0,0,0x40,0,0x20 };
const char ntpreqhdr[]  = { 0xE3,0,4,0xFA,0,1,0,0,0,1 };
const byte allOnes[] = { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };

word tcppacketLoop (word plen) {
  word len,save_len;
  byte send_fin;
  //if (plen>0) hexDump(buffer,plen);

  if (plen==0) {
    if ((waitgwmac & WGW_INITIAL_ARP || waitgwmac & WGW_REFRESHING) &&
                                          delaycnt==0 && isLinkUp())
      client_arp_whohas(gwip);
    delaycnt++;
    if (tcp_client_state==1 && (waitgwmac & WGW_HAVE_GW_MAC)) { // send a syn
      tcp_client_state = 2;
      tcpclient_src_port_l++; // allocate a new port
      client_syn(((tcp_fd<<5) | (0x1f & tcpclient_src_port_l)),tcp_client_port_h,tcp_client_port_l);
    }
    return 0;
  }

  if (eth_type_is_arp_and_my_ip(plen)) {
    //printf("ARP\n");
    if (gPB[ETH_ARP_OPCODE_L_P]==ETH_ARP_OPCODE_REQ_L_V){
		//printf("mkarp\n");
        make_arp_answer_from_request();
    }
    if (waitgwmac & WGW_ACCEPT_ARP_REPLY && (gPB[ETH_ARP_OPCODE_L_P]==ETH_ARP_OPCODE_REPLY_L_V) && client_store_gw_mac()){
		//printf("wgw\n");
		waitgwmac = WGW_HAVE_GW_MAC;
	}
    return 0;
  }

  if (eth_type_is_ip_and_my_ip(plen)==0){
    //printf("not ethtyp4me\n");
    return 0;
  }

  if (gPB[IP_PROTO_P]==IP_PROTO_ICMP_V && gPB[ICMP_TYPE_P]==ICMP_TYPE_ECHOREQUEST_V) {
    if (icmp_cb)
      (*icmp_cb)(&(gPB[IP_SRC_P]));
    //printf("ping requested\n");
    make_echo_reply_from_request(plen);
    return 0;
  }

  if (plen<54 && gPB[IP_PROTO_P]!=IP_PROTO_TCP_V )
    return 0;
  if ( gPB[TCP_DST_PORT_H_P]==TCPCLIENT_SRC_PORT_H) {
    if (check_ip_message_is_from(hisip)==0)
      return 0;
    if (gPB[TCP_FLAGS_P] & TCP_FLAGS_RST_V) {
      if (client_tcp_result_cb)
(*client_tcp_result_cb)((gPB[TCP_DST_PORT_L_P]>>5)&0x7,3,0,0);
      tcp_client_state = 5;
      return 0;
    }
    len = get_tcp_data_len();
    if (tcp_client_state==2) {
      if ((gPB[TCP_FLAGS_P] & TCP_FLAGS_SYN_V) && (gPB[TCP_FLAGS_P] &TCP_FLAGS_ACK_V)) {
        make_tcp_ack_from_any(0,0);
        gPB[TCP_FLAGS_P] = TCP_FLAGS_ACK_V|TCP_FLAGS_PUSH_V;
        if (client_tcp_datafill_cb)
          len = (*client_tcp_datafill_cb)((gPB[TCP_SRC_PORT_L_P]>>5)&0x7);
        else
          len = 0;
        tcp_client_state = 3;
        make_tcp_ack_with_data_noflags(len);
      }else{
        tcp_client_state = 1; // retry
        len++;
        if (gPB[TCP_FLAGS_P] & TCP_FLAGS_ACK_V)
          len = 0;
        make_tcp_ack_from_any(len,TCP_FLAGS_RST_V);
      }
      return 0;
    }
    if (tcp_client_state==3 && len>0) {
      tcp_client_state = 4;
      if (client_tcp_result_cb) {
        word tcpstart = TCP_DATA_START; // TCP_DATA_START is a formula
        if (tcpstart>plen-8)
          tcpstart = plen-8; // dummy but save
        save_len = len;
        if (tcpstart+len>plen)
          save_len = plen-tcpstart;
        send_fin = (*client_tcp_result_cb)((gPB[TCP_DST_PORT_L_P]>>5)&0x7,0,tcpstart,save_len);
        if (send_fin) {
          make_tcp_ack_from_any(len,TCP_FLAGS_PUSH_V|TCP_FLAGS_FIN_V);
          tcp_client_state = 5;
          return 0;
        }
      }
    }
    if (tcp_client_state != 5) {
      if (gPB[TCP_FLAGS_P] & TCP_FLAGS_FIN_V) {
        make_tcp_ack_from_any(len+1,TCP_FLAGS_PUSH_V|TCP_FLAGS_FIN_V);
        tcp_client_state = 5; // connection terminated
      } else if (len>0)
        make_tcp_ack_from_any(len,0);
    }
    return 0;
  }
  if (gPB[TCP_DST_PORT_H_P] == (hisport >> 8) &&
      gPB[TCP_DST_PORT_L_P] == ((byte) hisport)) {
    if (gPB[TCP_FLAGS_P] & TCP_FLAGS_SYN_V)
      make_tcp_synack_from_syn();
    else if (gPB[TCP_FLAGS_P] & TCP_FLAGS_ACK_V) {
      info_data_len = get_tcp_data_len();
      if (info_data_len > 0) {
        len = TCP_DATA_START; // TCP_DATA_START is a formula
        if (len <= plen - 8)
          return len;
      } else if (gPB[TCP_FLAGS_P] & TCP_FLAGS_FIN_V)
        make_tcp_ack_from_any(0,0);
    }
  }

  return 0;
}

 void step_seq(word rel_ack_num,byte cp_seq) {
  byte i;
  byte tseq;
  i = 4;
  while(i>0) {
    rel_ack_num = gPB[TCP_SEQ_H_P+i-1]+rel_ack_num;
    tseq = gPB[TCP_SEQACK_H_P+i-1];
    gPB[TCP_SEQACK_H_P+i-1] = rel_ack_num;
    if (cp_seq)
      gPB[TCP_SEQ_H_P+i-1] = tseq;
    else
      gPB[TCP_SEQ_H_P+i-1] = 0; // some preset value
    rel_ack_num = rel_ack_num>>8;
    i--;
  }
}

 void make_tcphead(word rel_ack_num,byte cp_seq) {
  byte j;
  byte i = gPB[TCP_DST_PORT_H_P];
  gPB[TCP_DST_PORT_H_P] = gPB[TCP_SRC_PORT_H_P];
  gPB[TCP_SRC_PORT_H_P] = i;
  j = gPB[TCP_DST_PORT_L_P];
  gPB[TCP_DST_PORT_L_P] = gPB[TCP_SRC_PORT_L_P];
  gPB[TCP_SRC_PORT_L_P] = j;
  step_seq(rel_ack_num,cp_seq);
  gPB[TCP_CHECKSUM_H_P] = 0;
  gPB[TCP_CHECKSUM_L_P] = 0;
  gPB[TCP_HEADER_LEN_P] = 0x50;
}
 void make_tcp_synack_from_syn() {
  gPB[IP_TOTLEN_H_P] = 0;
  gPB[IP_TOTLEN_L_P] = IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+4;
  make_eth_ip();
  gPB[TCP_FLAGS_P] = TCP_FLAGS_SYNACK_V;
  make_tcphead(1,0);
  gPB[TCP_SEQ_H_P+0] = 0;
  gPB[TCP_SEQ_H_P+1] = 0;
  gPB[TCP_SEQ_H_P+2] = seqnum;
  gPB[TCP_SEQ_H_P+3] = 0;
  seqnum += 3;
  gPB[TCP_OPTIONS_P] = 2;
  gPB[TCP_OPTIONS_P+1] = 4;
  gPB[TCP_OPTIONS_P+2] = 0x05;
  gPB[TCP_OPTIONS_P+3] = 0x0;
  gPB[TCP_HEADER_LEN_P] = 0x60;
  gPB[TCP_WIN_SIZE] = 0x5; // 1400=0x578
  gPB[TCP_WIN_SIZE+1] = 0x78;
  fill_checksum(TCP_CHECKSUM_H_P, IP_SRC_P, 8+TCP_HEADER_LEN_PLAIN+4,2);
  encpacketSend(IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+4+ETH_HEADER_LEN);
}

 byte eth_type_is_ip_and_my_ip(word len) {
  return len >= 42 && gPB[ETH_TYPE_H_P] == ETHTYPE_IP_H_V &&
                      gPB[ETH_TYPE_L_P] == ETHTYPE_IP_L_V &&
                      gPB[IP_HEADER_LEN_VER_P] == 0x45 &&
                      memcmp(gPB + IP_DST_P, myip, 4) == 0;
}

 byte eth_type_is_arp_and_my_ip(word len) {
  //printf("ARP Test with %x %x\n",gPB[ETH_TYPE_H_P],gPB[ETH_TYPE_L_P]);
  return len >= 41 && gPB[ETH_TYPE_H_P] == ETHTYPE_ARP_H_V &&
                      gPB[ETH_TYPE_L_P] == ETHTYPE_ARP_L_V &&
                      memcmp(gPB + ETH_ARP_DST_IP_P, myip, 4) == 0;
}
 void make_arp_answer_from_request() {
  setMACs(gPB + ETH_SRC_MAC);
  gPB[ETH_ARP_OPCODE_H_P] = ETH_ARP_OPCODE_REPLY_H_V;
  gPB[ETH_ARP_OPCODE_L_P] = ETH_ARP_OPCODE_REPLY_L_V;
  copyMac(gPB + ETH_ARP_DST_MAC_P, gPB + ETH_ARP_SRC_MAC_P);
  copyMac(gPB + ETH_ARP_SRC_MAC_P, mymac);
  copyIp(gPB + ETH_ARP_DST_IP_P, gPB + ETH_ARP_SRC_IP_P);
  copyIp(gPB + ETH_ARP_SRC_IP_P, myip);
  encpacketSend(42);
}
 void make_echo_reply_from_request(word len) {
  make_eth_ip();
  gPB[ICMP_TYPE_P] = ICMP_TYPE_ECHOREPLY_V;
  if (gPB[ICMP_CHECKSUM_P] > (0xFF-0x08))
      gPB[ICMP_CHECKSUM_P+1]++;
  gPB[ICMP_CHECKSUM_P] += 0x08;
  encpacketSend(len);
}
 void make_tcp_ack_from_any(int16_t datlentoack,byte addflags) {
	word j;
  gPB[TCP_FLAGS_P] = TCP_FLAGS_ACK_V|addflags;
  if (addflags!=TCP_FLAGS_RST_V && datlentoack==0)
    datlentoack = 1;
  make_tcphead(datlentoack,1); // no options
  j = IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN;
  gPB[IP_TOTLEN_H_P] = j>>8;
  gPB[IP_TOTLEN_L_P] = j;
  make_eth_ip();
  gPB[TCP_WIN_SIZE] = 0x4; // 1024=0x400, 1280=0x500 2048=0x800 768=0x300
  gPB[TCP_WIN_SIZE+1] = 0;
  fill_checksum(TCP_CHECKSUM_H_P, IP_SRC_P, 8+TCP_HEADER_LEN_PLAIN,2);
  encpacketSend(IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+ETH_HEADER_LEN);
}
 void make_tcp_ack_with_data_noflags(word dlen) {
  word j = IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+dlen;
  gPB[IP_TOTLEN_H_P] = j>>8;
  gPB[IP_TOTLEN_L_P] = j;
  fill_ip_hdr_checksum();
  gPB[TCP_CHECKSUM_H_P] = 0;
  gPB[TCP_CHECKSUM_L_P] = 0;
  fill_checksum(TCP_CHECKSUM_H_P, IP_SRC_P, 8+TCP_HEADER_LEN_PLAIN+dlen,2);
  encpacketSend(IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+dlen+ETH_HEADER_LEN);
}
//-----
 word get_tcp_data_len() {
  int16_t i = (((int16_t)gPB[IP_TOTLEN_H_P])<<8)|gPB[IP_TOTLEN_L_P];
  i -= IP_HEADER_LEN;
  i -= (gPB[TCP_HEADER_LEN_P]>>4)*4; // generate len in bytes;
  if (i<=0)
    i = 0;
  return (word)i;
}
 byte check_ip_message_is_from(const byte *ip) {
  return memcmp(gPB + IP_SRC_P, ip, 4) == 0;
}

//---------
 void fill_checksum(byte dest, byte off, word len,byte type) {
  word ck;
  const byte* ptr = gPB + off;
 long sum = type==1 ? IP_PROTO_UDP_V+len-8 :
                  type==2 ? IP_PROTO_TCP_V+len-8 : 0;
  while(len >1) {
    sum += (word) (((unsigned long)*ptr<<8)|*(ptr+1));
    ptr+=2;
    len-=2;
  }
  if (len)
    sum += ((unsigned long)*ptr)<<8;
  while (sum>>16)
    sum = (word) sum + (sum >> 16);
  ck = ~ (word) sum;
  gPB[dest] = ck>>8;
  gPB[dest+1] = ck;
}
//---------

 void fill_ip_hdr_checksum() {
  gPB[IP_CHECKSUM_P] = 0;
  gPB[IP_CHECKSUM_P+1] = 0;
  gPB[IP_FLAGS_P] = 0x40; // don't fragment
  gPB[IP_FLAGS_P+1] = 0;  // fragement offset
  gPB[IP_TTL_P] = 64; // ttl
  fill_checksum(IP_CHECKSUM_P, IP_P, IP_HEADER_LEN,0);
}

 void make_eth_ip() {
  setMACs(gPB + ETH_SRC_MAC);
  copyIp(gPB + IP_DST_P, gPB + IP_SRC_P);
  copyIp(gPB + IP_SRC_P, myip);
  fill_ip_hdr_checksum();
}


 byte client_store_gw_mac() {
  if (memcmp(gPB + ETH_ARP_SRC_IP_P, gwip, 4) != 0)
    return 0;
  copyMac(gwmacaddr, gPB + ETH_ARP_SRC_MAC_P);
  return 1;
}

 void setMACs (const byte *mac) {
  copyMac(gPB + ETH_DST_MAC, mac);
  copyMac(gPB + ETH_SRC_MAC, mymac);
}
// make a arp request
 void client_arp_whohas(byte *ip_we_search) {
  setMACs(allOnes);
  gPB[ETH_TYPE_H_P] = ETHTYPE_ARP_H_V;
  gPB[ETH_TYPE_L_P] = ETHTYPE_ARP_L_V;
  memcpy(gPB + ETH_ARP_P,arpreqhdr,8);
  memset(gPB + ETH_ARP_DST_MAC_P, 0, 6);
  copyMac(gPB + ETH_ARP_SRC_MAC_P, mymac);
  copyIp(gPB + ETH_ARP_DST_IP_P, ip_we_search);
  copyIp(gPB + ETH_ARP_SRC_IP_P, myip);
  waitgwmac |= WGW_ACCEPT_ARP_REPLY;
  encpacketSend(42);
}

 void client_syn(byte srcport,byte dstport_h,byte dstport_l) {
  setMACandIPs(gwmacaddr, hisip);
  gPB[ETH_TYPE_H_P] = ETHTYPE_IP_H_V;
  gPB[ETH_TYPE_L_P] = ETHTYPE_IP_L_V;
  memcpy(gPB + IP_P,iphdr,9);
  gPB[IP_TOTLEN_L_P] = 44; // good for syn
  gPB[IP_PROTO_P] = IP_PROTO_TCP_V;
  fill_ip_hdr_checksum();
  gPB[TCP_DST_PORT_H_P] = dstport_h;
  gPB[TCP_DST_PORT_L_P] = dstport_l;
  gPB[TCP_SRC_PORT_H_P] = TCPCLIENT_SRC_PORT_H;
  gPB[TCP_SRC_PORT_L_P] = srcport; // lower 8 bit of src port
  memset(gPB + TCP_SEQ_H_P, 0, 8);
  gPB[TCP_SEQ_H_P+2] = seqnum;
  seqnum += 3;
  gPB[TCP_HEADER_LEN_P] = 0x60; // 0x60=24 len: (0x60>>4) * 4
  gPB[TCP_FLAGS_P] = TCP_FLAGS_SYN_V;
  gPB[TCP_WIN_SIZE] = 0x3; // 1024 = 0x400 768 = 0x300, initial window
  gPB[TCP_WIN_SIZE+1] = 0x0;
  gPB[TCP_CHECKSUM_H_P] = 0;
  gPB[TCP_CHECKSUM_L_P] = 0;
  gPB[TCP_CHECKSUM_L_P+1] = 0;
  gPB[TCP_CHECKSUM_L_P+2] = 0;
  gPB[TCP_OPTIONS_P] = 2;
  gPB[TCP_OPTIONS_P+1] = 4;
  gPB[TCP_OPTIONS_P+2] = (CLIENTMSS>>8);
  gPB[TCP_OPTIONS_P+3] = (byte) CLIENTMSS;
  fill_checksum(TCP_CHECKSUM_H_P, IP_SRC_P, 8 +TCP_HEADER_LEN_PLAIN+4,2);
  // 4 is the tcp mss option:
  encpacketSend(IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+ETH_HEADER_LEN+4);
}
 void setMACandIPs (const byte *mac, const byte *dst) {
  setMACs(mac);
  copyIp(gPB + IP_DST_P, dst);
  copyIp(gPB + IP_SRC_P, myip);
}



/*
46004000C003
FFFFFFFFFFFFBC77 3776B83A08060001
                         tptl=0806=ARP
080006040001BC77 3776B83AC0A80167
000000000000C0A8 01BE000000000000
            ipip ipip=192.168.1.190
0000000000000000 5FE909A2
*/
