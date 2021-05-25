
#include <Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x3F, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE); // Set the LCD I2C address

void setup() {

   lcd.begin(20,4); 
   lcd.clear();
}

void loop() {
   lcd.setCursor(2,1);
   lcd.print ("Hello! ");
   lcd.setCursor(10,2);          // start on the eleventh position of the third line of the display
   lcd.print("World!");
   delay (1000);

   for (int j=0; j<4; j++){
        lcd.setCursor(00,j);
        lcd.clear();                  // clears the line where the cursor is positioned
   }   

   delay(500);
}
