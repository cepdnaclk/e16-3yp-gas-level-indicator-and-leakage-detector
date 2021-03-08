
int Buzzer = D7;

void setup(){
  pinMode (Buzzer, OUTPUT);
}

void loop(){
  digitalWrite (Buzzer, HIGH); //turn buzzer on
  delay(1000);
  digitalWrite (Buzzer, LOW);  //turn buzzer off
  delay(1000);
}