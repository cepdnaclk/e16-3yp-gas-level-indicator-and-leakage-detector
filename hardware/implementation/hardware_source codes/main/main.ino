#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>
#include "HX711.h"
#define BLYNK_PRINT Serial
#include <Blynk.h>
#include <BlynkSimpleEsp8266.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#define BLYNK_PRINT Serial

LiquidCrystal_I2C lcd(0x27, 16, 2);

//const char* ssid = "REPLACE_WITH_YOUR_SSID";
//const char* password = "REPLACE_WITH_YOUR_PASSWORD";

//define intial status of the device
#define SELECT5 D0
#define SELECTD10 D8
#define OLED1 D1
#define OLED2 D2
#define GASDD D5
#define GASAD D6
#define BUZZER D7
#define WEIGHT1 D8
#define WEIGHT2 D4

int rbutton = WEIGHT2; // this button will be used to reset the scale to 0.
float weight;
float calibration_factor = -101525; // for me this vlaue works just perfect 419640

#define DEVICENAME "G2105_0009"

//Your Domain name with URL path or IP address with path
String serverName = "http://192.168.1.106:1880/update-sensor";

// the following variables are unsigned longs because the time, measured in
// milliseconds, will quickly become a bigger number than can be stored in an int.
unsigned long lastTime = 0;
// Timer set to 10 minutes (600000)
//unsigned long timerDelay = 600000;
// Set timer to 5 seconds (5000)
unsigned long timerDelay = 5000;

//Serial Commands prints
String current="Current Reading : ";
String scaled="Required Reading : ";
String gasStatus = "Gas Percentage : ";
String gasLeak = "Gas Leakage : ";

void setup() {
 Serial.begin(115200); 

  WiFi.begin(ssid, password);
  Serial.println("Establishing Connection ...");
  while(WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected");
 
  Serial.println("Timer set to 5 seconds (timerDelay variable), it will take 5 seconds before publishing the first reading.");
}
  
}

void loop() {
  
  //Send an HTTP POST request every 10 minutes
  //------------------------------------------------------------------Weight Sensor---------------------------------------------------------------------------------------------
  Blynk.run();
  scale.set_scale(calibration_factor); //Adjust to this calibration factor
 
  weight = scale.get_units(5); 
  /*
   * if (SELECT5 == HIGH){
   *    weight = weight - 1 ;
   * }
   * percentage = weight/5*100;
   */
  weight = weight * 100;
  lcd.setCursor(0, 0);
  lcd.print("Weight Percentage");
  lcd.setCursor(0, 1);
  lcd.print(weight);
  lcd.print("%");
  Blynk.virtualWrite(V3, weight);
  delay(2000);
  lcd.clear();
  
  Serial.print("Weight: ");
  Serial.print(weight);
  Serial.println("%");
  Serial.println();
  
 
  if ( digitalRead(rbutton) == LOW)
{
  scale.set_scale();
  scale.tare(); //Reset the scale to 0
}
  ////----------------------------------------------------------------Gas Sensor---------------------------------------------------------------------------------------------
     float sensorVoltage; 
  float sensorValue;
 
  sensorValue = analogRead(A0);
  sensorVoltage = sensorValue/1024*5.0;
 
  Serial.print("sensor voltage = ");
  Serial.print(sensorVoltage);
  Serial.println(" V");
  delay(1000);
}
  //------------------------------------------------------------------Request Handling---------------------------------------------------------------------------------------------
  //if ((millis() - lastTime) > timerDelay) {
  if ((millis() - lastTime) > delay(2000)) {
    //Check WiFi connection status
    if(WiFi.status()== WL_CONNECTED){
      HTTPClient http;
      
      // Your Domain name with URL path or IP address with path
      http.begin(serverName);

      // Specify content-type header
      http.addHeader("Content-Type", "application/x-www-form-urlencoded");
      // Data to send with HTTP POST
      String httpRequestData = "device_id=" + d0006 + "&percentage=" + weightPercentage;
      // Send HTTP POST request
      int httpResponseCode = http.POST(httpRequestData);
      
      // If you need an HTTP request with a content type: application/json, use the following:
      //http.addHeader("Content-Type", "application/json");
      //int httpResponseCode = http.POST("{\"api_key\":\"tPmAT5Ab3j7F9\",\"sensor\":\"BME280\",\"value1\":\"24.25\",\"value2\":\"49.54\",\"value3\":\"1005.14\"}");

      // If you need an HTTP request with a content type: text/plain
      //http.addHeader("Content-Type", "text/plain");
      //int httpResponseCode = http.POST("Hello, World!");
     
      Serial.print("HTTP Response code: ");
      Serial.println(httpResponseCode);
        
      // Free resources
      http.end();
    }
    else {
      Serial.println("WiFi Disconnected");
    }
    lastTime = millis();
  }

  //Serial Status
  Serial.println(current + weight);
  Serial.println(scaled + weight*100);
  Serial.println(gasStatus + percentage);
  Serial.println(gasLeak + gasOut);
  Serial.println();
  delay(2000);
}
