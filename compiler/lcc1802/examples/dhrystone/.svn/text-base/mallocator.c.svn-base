char* malloc_ptr=(char *)0x6000; //allows for 24k program+data, 8k stack, does no checks
void* malloc(int size)
{
  void* ret;
  ret = (void*)malloc_ptr;
  malloc_ptr += size;
  return ret;
}
