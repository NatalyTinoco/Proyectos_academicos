int pinPot = A0;

int pinLed = 3;

int valorPot;

int parpadeo;

void setup() {

pinMode(pinLed, OUTPUT);

}

void loop() {

valorPot = analogRead(pinPot);

parpadeo = map(valorPot, 0, 1023, 0, 500);

digitalWrite(pinLed, HIGH);

delay(parpadeo);

digitalWrite(pinLed, LOW);

delay(parpadeo);

}
