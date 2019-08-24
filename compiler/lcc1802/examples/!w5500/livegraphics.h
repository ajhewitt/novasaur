//15-04-04 created for live graphics demo
	static unsigned char hdr1a[]="HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n" //beginning of header
						"<html><body>"
						"<span style=\"color:#0000A0\">\r\n"
						"<center><b>OLDUINO Dynamic Graphics Demo</b>"
						"<br>(";
	static unsigned char hdr1b[]=" pages served)" //end of header
						"</center>"
						"<h1> </h1>"; //to force some spacing
		static unsigned char Inst1[]=
		"Use The URL bar as your command line:<br>" //50
		"...olduino.robotkiwi.com:1802/bitmap  displays a static bitmap<BR>"
		"...olduino.robotkiwi.com:1802/1861  displays the bitmap ala 1861<BR>"
		"Anything else or browser refresh displays this screen<BR>";
	static unsigned char trlr[]="</body></html>\r\n\r\n";
	static unsigned char olduinolink[]="<a href=\"http://goo.gl/RYbPYC\">Olduino</a>: An Arduino for the First of Us<p>";
	union IPaddr thisip={182}; //the ip that a form/request came from
