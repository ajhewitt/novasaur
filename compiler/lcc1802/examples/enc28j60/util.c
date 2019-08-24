void hexDump(uint8_t *data, uint16_t len) {
  int i;
  uint8_t cnt = 0;
  printf("dumping %d\n",len);
  for (i = 0; i < len; i++) {
    putx(data[i]);
    cnt++;
    if (cnt == 8) {
      putc(' ');
    }
    if (cnt == 16) {
      printf("\n");
      cnt = 0;
    }
  }
  if (cnt != 0) {
    printf("\n");
  }
}
