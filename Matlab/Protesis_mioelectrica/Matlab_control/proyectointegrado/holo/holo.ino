int onda;
void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
onda=analogRead(A1);
Serial.println(onda);
delay(75);
}
