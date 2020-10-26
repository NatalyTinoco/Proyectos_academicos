#define MEDIDA_MINIMA 10 // Cambio menor monitorizado
#define TIEMPO_MAXIMO_MEDIDA 200 // Cambio menor entre medidas (determina la resolución vertical)
#define TIEMPO_MINIMO_MEDIDA 100 // Milisegundos entre medidas (determina la resolución horizontal)

int lectura_anterior_oximetro = 0;
int lectura_oximetro;
unsigned long cronometro_minimo = 0;
unsigned long cronometro_maximo = 0;

void setup()
{
  Serial.begin(9600);
  //pinMode(PIN_OXIMETRO,INPUT); // Ya es entrada por defecto
}

void loop()
{
  if (millis() > cronometro_minimo)
  {
    lectura_oximetro = analogRead(A0);
    if (abs(lectura_oximetro - lectura_anterior_oximetro) > MEDIDA_MINIMA || millis() > cronometro_maximo)
    {
      cronometro_minimo = millis() + TIEMPO_MINIMO_MEDIDA;
      cronometro_maximo = millis() + TIEMPO_MAXIMO_MEDIDA;
      lectura_anterior_oximetro = lectura_oximetro;
      Serial.println(String(millis(), DEC) + "," + String(lectura_oximetro, DEC));
    }
  }
}
