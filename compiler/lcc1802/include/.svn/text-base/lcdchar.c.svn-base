//lcdcharacter.c - routines for character output to the nokia lcd
void LcdCharacter(char character)
{
  unsigned int index;
  LcdWrite(LCD_D, 0x00);
  for (index = 0; index < 5; index++)
  {
    LcdWrite(LCD_D, ASCII[character - 0x20][index]);
  }
  LcdWrite(LCD_D, 0x00);
}
void LcdString(char *characters)
{
  while (*characters)
  {
    LcdCharacter(*characters++);
  }
}
