word tcppacketLoop (word plen);
 void make_tcp_synack_from_syn();
 byte eth_type_is_ip_and_my_ip(word len);
 byte eth_type_is_arp_and_my_ip(word len);
 void make_arp_answer_from_request();
 void make_echo_reply_from_request(word len);
 void make_tcp_ack_from_any(int16_t datlentoack,byte addflags);
 void make_tcp_ack_with_data_noflags(word dlen);
 word get_tcp_data_len();
 byte check_ip_message_is_from(const byte *ip);
 void fill_checksum(byte dest, byte off, word len,byte type);
 void fill_ip_hdr_checksum();
 void make_eth_ip();
 byte client_store_gw_mac();
 void setMACs (const byte *mac);
 void client_arp_whohas(byte *ip_we_search);

 void client_syn(byte srcport,byte dstport_h,byte dstport_l);
 void setMACandIPs (const byte *mac, const byte *dst);

