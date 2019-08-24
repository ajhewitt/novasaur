#define numslots 32 //how many ip address slots i have
unsigned int nextslot=0; //what is the next one to use
union IPaddr regip[numslots]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,
							  17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32};//the ips i have registered
union IPaddr thisip={182}; //the ip that a form/request came from
unsigned int thisipslot;//thisip's slot in the secrets/stats tables
unsigned char secrets[numslots][4]={0}; //secret numbers for each registered ip
unsigned int ipturns[numslots];//number of moves for the IP
unsigned int ipgames[numslots];//number of games won by IP
int getipslot(union IPaddr whichip); //see if this ip is registered and register it if not
union IPaddr maxip={218}; //the ip that has won the most games
unsigned int maxipturns=0;//number of moves for the IP maxip
unsigned int maxipgames=0;//number of games won by IP maxip
