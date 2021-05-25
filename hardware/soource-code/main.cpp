#include <Arduino.h>
#include <OneWire.h> 
#include <WiFi.h>
#include <HTTPClient.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>

#define BUZZER_PORT 7
#define rbutton 4 // this button will be used to reset the scale to 0.


// set wifi credentials
const char* ssid = "YOUR_SSID";
const char* password = "YOUR_PASSWORD";

// Server name 
String serverName = "http://192.168.1.106:3000/";


// Essential global variables               
bool  leakageState;   // whether a leakge or not 
int percentage    // remaining percentage
float weight    //weight measurement
float initial_weight 
float size    // size ( 5 or 10 ) of the gas tank
float calibration_factor = -101525;   //value found from calibrating

// Set the LCD I2C address
LiquidCrystal_I2C lcd(0x3F, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE); 


int feed_time=1000;
OneWire oneWire(ONE_WIRE_BUS); 

void setup() {
    WiFi.begin(ssid, password);
    Serial.println("Connecting");
    while(WiFi.status() != WL_CONNECTED) {
      delay(500);
      // Serial.print(".");
    }

    //load cell
    HX711 scale(5, 6);
    pinMode(rbutton, INPUT_PULLUP); 
    scale.set_scale();
    scale.tare(); //Reset the scale to 0
    long zero_factor = scale.read_average(); //Get a baseline reading

    // lcd 
    lcd.begin(20,19);
    lcd.clear();

    // buzzer
    pinMode(BUZZER_PORT,OUTPUT);

    // Start up the library 
    sensors.begin(); 
}


void update_weight(){    // buzzer on
    scale.set_scale(calibration_factor); //Adjust to this calibration factor
    weight = scale.get_units(5); 
}

void calculate_percentage(){    // buzzer on
    float tank weight = initial_weight - size;  
    float remaning_weight = weight - weight;
    percentage remaning_weight*100/size;
}

void buzzerOn(){    // buzzer on
    digitalWrite(BUZZER_PORT,HIGH);
}

void buzzerOff(){   // buzzer off
    digitalWrite(BUZZER_PORT,LOW);
}

void lcd(){   // show the percentage
    lcd.print(percentage);
    delay (30000);
    lcd.clear();
}


unsigned char checkLeakage(){
    sensorValue = analogRead(A0);
    sensorVoltage = sensorValue/1024*5.0;
    if(sensorVoltage>3){
    leakageState=true; 
    }else{
      leakageState=false;
    }
}


void sendData(){
  // send data to the server
  String serverPath = serverName + "?" + percentage;

// Your Domain name with URL path or IP address with path
  // http.begin(serverPath.c_str());

// Send HTTP GET request
//  int httpResponseCode = http.GET();
}

void getStableTemparatue(){

}

void getFeedTime(){

}

void loop() {

}