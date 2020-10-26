#include TM1638.h

// define a module on data pin 8, clock pin 9 and strobe pin 7
TM1638 module(8, 9, 7);

// variables para controlar los pines y los leds
int entradaAnalogica = 1;
float Vout = 0.0;
float Vin = 0.0;
float R1 = 47000.0; //valor de la primera resistencia
float R2 = 4700.0; // valor de la segunda resistencia
String volt = "vin";
//variable para almacenar el valor.
float valor = 0;

void setup(){
pinMode(entradaAnalogica, INPUT);
}

void loop()
{
//leyendo la entrada de voltaje
valor = analogRead(entradaAnalogica);

//adaptando el valor, si queremos ser más precisos medimos la tensión de la salida de 5v de arduino y tierra y sustituimos 5.0 por ese valor.
Vout = (valor * 5.0) / 1024.0;
//calculando el voltaje
Vin = Vout / (R2/ (R1+R2));
module.setDisplayToDecNumber(Vin * 10, 4);  // el por 10 es para ver el voltaje con dos decimales. Y el punto para saber que esta encendido
delay(200);
}
