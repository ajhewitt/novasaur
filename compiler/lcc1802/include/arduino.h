//march 10 2013 dummy arduino.h for lcc arduino integration
void delay(unsigned int);
void digitalWrite(unsigned char,unsigned char);
int digitalRead(unsigned char); //nb, always reads ef3
unsigned char PIN4=0; //used to save what's written to the output port
#define LOW 0
#define HIGH 1
#define OUTPUT 1
#define INPUT 0
