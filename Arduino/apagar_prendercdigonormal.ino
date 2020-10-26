int estadoActual1 = 0;
int estadoActual2 = 0;
int estadoUltimo = 0;
int contador = 0;

void setup()
{
  pinMode(3, OUTPUT);
  pinMode(2, INPUT);
  Serial.begin(115200);
}

void loop()
{
  estadoActual1 = digitalRead(2);
  delay(10);
  estadoActual2 = digitalRead(2);
  if (estadoActual1 == estadoActual2)
  {
    if (estadoActual1 != estadoUltimo)
    {
      if (estadoActual1 == HIGH)
      {
        contador = contador + 1;
      }
    }
  }
  estadoUltimo = estadoActual1;
  if (contador % 2 == 0 )
  {
    digitalWrite(13, LOW);
    Serial.write("OFF");
  }
  else
  {
    digitalWrite(13, HIGH);
    Serial.write("OFF");
  }
}
