#include "HX711.h"
#include <ESP8266WiFi.h>;
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27, 16, 2);
 
String apiKey = "3DHYLTJBZOF4DFTO"; //   Write API key from ThingSpeak
const char *ssid = "BYNARK"; //   wifi ssid and wpa2 key
const char *pass = "bynark@123";
const char* server = "api.thingspeak.com";
 
WiFiClient client;
 
HX711 scale(D5, D6);
 
int rbutton = D4; // to reset the scale to 0.
float weight;
float calibration_factor = -101525; 
 
void setup() 
{
  Serial.begin(115200);
  pinMode(rbutton, INPUT_PULLUP); 
  scale.set_scale();
  scale.tare(); //Reset the scale to 0
  long zero_factor = scale.read_average(); //Get a baseline reading
  Wire.begin(D2, D1);
  lcd.begin();
  lcd.setCursor(6,0);
  lcd.print("IOT");
  lcd.setCursor(1,1);
  lcd.print("Weighing Scale");
  delay(3000);
  lcd.clear();
 
  lcd.print("Connecting Wifi");
  lcd.setCursor(0,1);
  lcd.print("& Thingspeak");
  
  WiFi.begin(ssid, pass);
  {
  delay(500);
  Serial.print(".");
  lcd.clear();
  }
  Serial.println("");
  Serial.println("WiFi connected");
  lcd.clear();
  lcd.print("WiFi connected");
  
  delay(3000);
}
 
void loop() 
 
{
 
  scale.set_scale(calibration_factor); //Adjust to this calibration factor
 
  weight = scale.get_units(5); 
 
  lcd.setCursor(0, 0);
  lcd.print("Measured Weight");
  lcd.setCursor(0, 1);
  lcd.print(weight);
  lcd.print(" KG  ");
  delay(1500);
  lcd.clear();
  
  Serial.print("Weight: ");
  Serial.print(weight);
  Serial.println(" KG");
  Serial.println();
 
  if ( digitalRead(rbutton) == LOW)
{
  scale.set_scale();
  scale.tare(); //Reset the scale to 0
}
  if (client.connect(server, 80)) // "184.106.153.149" or api.thingspeak.com
{
  String postStr = apiKey;
  postStr +="&field1=";
  postStr += String(weight);
  postStr += "\r\n\r\n";
        
  client.print("POST /update HTTP/1.1\n");
  client.print("Host: api.thingspeak.com\n");
  client.print("Connection: close\n");
  client.print("X-THINGSPEAKAPIKEY: "+apiKey+"\n");
  client.print("Content-Type: application/x-www-form-urlencoded\n");
  client.print("Content-Length: ");
  client.print(postStr.length());
  client.print("\n\n");
  client.print(postStr);  
}
  client.stop();
  Serial.println("Waiting...");
  //delay(1500);  
 
}