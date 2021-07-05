# cat input.hex | awk -f hex2load.awk

{
  b=length($1)-11
  a=substr($1,10,b)
  c=0
  while(c<b) {
    print substr(a,c+1,2)
    c=c+2
  }
}
