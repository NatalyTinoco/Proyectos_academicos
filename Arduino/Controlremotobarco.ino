char val;
int enableA = 5; //velocidad motor A
int dirmotorA1 = 6; // direccion motor a
int dirmotorA2= 7;  // direccion motor a
int enableB = 8; //velocidad motor B
int dirmotorB1 = 9; // direccion motor b
int dirmotorB2= 10; // direccion motor b
int velocidad = 255;
//Métodos para el control adelante, atras, derecha
// izquierda y stop
void adelante(){
digitalWrite (dirmotorA1,HIGH);// gira motor A derecha
digitalWrite (dirmotorA2,LOW);
analogWrite (enableA, velocidad);
digitalWrite (dirmotorB1,LOW);// gira motor B izquierda
digitalWrite (dirmotorB2,HIGH);
analogWrite (enableB, velocidad);
}
void atras(){
digitalWrite (dirmotorA1,LOW);// gira motor A izquierda
digitalWrite (dirmotorA2,HIGH);
analogWrite (enableA, velocidad);
digitalWrite (dirmotorB1,HIGH);// gira motor B derecha
digitalWrite (dirmotorB2,LOW);
analogWrite (enableB, velocidad);
}
void izquierda(){
digitalWrite (dirmotorA1,HIGH);// gira motor A derecha
digitalWrite (dirmotorA2,LOW);
analogWrite (enableA, velocidad);
digitalWrite (dirmotorB1,HIGH);// gira motor B derecha
digitalWrite (dirmotorB2,LOW);
 analogWrite (enableB, 0);
}
void derecha(){
digitalWrite (dirmotorA1,LOW);// gira motor A izquierda
digitalWrite (dirmotorA2,HIGH);
analogWrite (enableA, 0);
digitalWrite (dirmotorB1,LOW);// gira motor B izquierda
digitalWrite (dirmotorB2,HIGH);
analogWrite (enableB,velocidad);
}
void paro(){
digitalWrite (dirmotorA1,HIGH);// para motor A
digitalWrite (dirmotorA2,HIGH);
analogWrite (enableA, 0);
digitalWrite (dirmotorB1,HIGH);// para motor B
digitalWrite (dirmotorB2,HIGH);
analogWrite (enableB, 0);
}
// comenzamos parando los motores
void setup(){
int i;
for(i=5;i<11;i++){
           pinMode(i, OUTPUT); //poner pin 5,6,7,8,9,10,11 de salida
}
Serial.begin(9600);
paro();
}
// Y el bucle principal
void loop() {
if( Serial.available() ) {
        val = Serial.read();
}
switch (val) {
case 'c':
  paro();
  break;
case 'a':
  adelante();
  break;
case 'e':
  atras();
  break;
case 'b':
  izquierda();
  break;
case 'd':
  derecha();
  break;
}
}

