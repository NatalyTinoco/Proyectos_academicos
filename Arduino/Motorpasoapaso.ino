int pin1=3;
int pin2=4;
int pin3=5;
int pin4=6; 
// paso simple
int paso[4][4] =
{
  {1, 0, 0, 0},
  {0, 1, 0, 0},
  {0, 0, 1, 0},
  {0, 0, 0, 1}
};
//paso doble
int paso2[4][4] =
{
  {1, 1, 0, 0},
  {0, 1, 1, 0},
  {0, 0, 1, 1},
  {1, 0, 0, 1}
};
// medio paso
 int paso3[8][4] =
{
  {1, 0, 0, 0},
  {1, 1, 0, 0},
  {0, 1, 0, 0},
  {0, 1, 1, 0},
  {0, 0, 1, 0},
  {0, 0, 1, 1},
  {0, 0, 0, 1},
  {1, 0, 0, 1}
};
void setup()
{
Serial.begin(9600);  // Abre la conexión con el puerto de serie
// Todos los pines en modo salida
pinMode(pin1, OUTPUT);
pinMode(pin2, OUTPUT);
pinMode(pin3, OUTPUT);
pinMode(pin4, OUTPUT);
Serial.println("OPCIONES");
Serial.println("1. Paso simple");
Serial.println("2. Paso doble");
Serial.println("3. Medio paso"); 
}
  
void loop(){
 //si existe datos disponibles los leemos
if (Serial.available()>0){
 //leemos la opcion enviada
int opcion=Serial.read(); 
Serial.write(opcion); 
switch(opcion){
case 1:
  while(opcion=1){
    for (int i = 0; i < 4; i++){
    digitalWrite(pin1, paso[i][0]);
    digitalWrite(pin2, paso[i][1]);
    digitalWrite(pin3, paso[i][2]);
    digitalWrite(pin4, paso[i][3]);
    delay(5);
    Serial.println("ssss");
  }
  }
case 2:
  while(opcion=2){
    for (int i = 0; i < 4; i++){
    digitalWrite(pin1, paso2[i][0]);
    digitalWrite(pin2, paso2[i][1]);
    digitalWrite(pin3, paso2[i][2]);
    digitalWrite(pin4, paso2[i][3]);
    delay(5);
    }
  }
case 3:
  while(opcion=3){
    for (int i = 0; i < 8; i++){
    digitalWrite(pin1, paso3[i][0]);
    digitalWrite(pin2, paso3[i][1]);
    digitalWrite(pin3, paso3[i][2]);
    digitalWrite(pin4, paso3[i][3]);
    delay(5);
    }
  }
case 4:    // una mano no esta cersa del sensor
    Serial.println("bright");
    break;
  }
  delay(1);        // retraso entre lecturas para la estabilidad
}  
 }

