// Wire Master Reader
// by Nicholas Zambetti <http://www.zambetti.com>

// Demonstrates use of the Wire library
// Reads data from an I2C/TWI slave device
// Refer to the "Wire Slave Sender" example for use with this

// Created 29 March 2006

// This example code is in the public domain.


#include <Wire.h>
int a=22;
int b=24;
int c=26;
int d=28;
int e=30;
int f=32;
int g=34;
int a1=31;
int b1=33;
int c1=35;
int d1=37;
int e1=39;
int f1=41;
int g1=43;
int jugador1=0;
int jugador2=0;
int jugador3=0;
int jugador4=0;
int dado1;
int dado2;
int ganador;
void setup()
{
  Wire.begin();        // join i2c bus (address optional for master)
  Serial.begin(9600);  // start serial for output

  pinMode (a,OUTPUT); //declaramos el led como salida
  pinMode (b,OUTPUT); 
  pinMode (c,OUTPUT); 
  pinMode (d,OUTPUT); 
  pinMode (e,OUTPUT); 
  pinMode (f,OUTPUT); 
  pinMode (g,OUTPUT); 
  pinMode (a1,OUTPUT);
  pinMode (b1,OUTPUT);
  pinMode (c1,OUTPUT);
  pinMode (d1,OUTPUT);
  pinMode (e1,OUTPUT);
  pinMode (f1,OUTPUT);
  pinMode (g1,OUTPUT);
  
  
 
}

void loop()
{
  Wire.requestFrom(8, 6);    // request 6 bytes from slave device #8
  while (Wire.available())   // slave may send less than requested
  {
    int dado1 = Wire.read(); // receive a byte as character
    Serial.print(dado1);         // print the character
switch(dado1){

  case 1:
 
  digitalWrite(e,HIGH);
  delay(1000);
  digitalWrite(e,LOW);
  delay(1000);
  break;
  case 2:
   digitalWrite(a,HIGH);
     digitalWrite(g,HIGH);
  delay(1000);
  digitalWrite(a,LOW);
  digitalWrite(g,LOW);

  break;
  case 3:
     digitalWrite (a,HIGH);
  digitalWrite (g,HIGH);
  digitalWrite (e,HIGH);
  delay ( 1000);
   digitalWrite (a,LOW);
  digitalWrite (g,LOW);
  digitalWrite (e,LOW);
  break;
  case 4:
   digitalWrite (a,HIGH);
  digitalWrite (c,HIGH);
  digitalWrite (d,HIGH);
  digitalWrite (g,HIGH);
  delay ( 1000);
  digitalWrite (a,LOW);
  digitalWrite (c,LOW);
  digitalWrite (d,LOW);
  digitalWrite (g,LOW);
  break;
  case 5:
    digitalWrite (a,HIGH);
  digitalWrite (c,HIGH); 
  digitalWrite (d,HIGH);
  digitalWrite (g,HIGH);
  digitalWrite (e,HIGH);
  delay (1000);
  digitalWrite (a,LOW);
  digitalWrite (c,LOW); 
  digitalWrite (d,LOW);
  digitalWrite (g,LOW);
  digitalWrite (e,LOW);
  break;
  case 6:
  digitalWrite (a,HIGH);
  digitalWrite (b,HIGH);
  digitalWrite (c,HIGH);
  digitalWrite (d,HIGH);
  digitalWrite (g,HIGH); 
  digitalWrite (f,HIGH);
  delay (1000); 
   digitalWrite (a,LOW);
  digitalWrite (b,LOW);
  digitalWrite (c,LOW);
  digitalWrite (d,LOW);
  digitalWrite (g,LOW);
  digitalWrite (f,LOW);
  break;
  
}
//delay(10);
Wire.requestFrom(9, 6);
  }
  while (Wire.available())   // slave may send less than requested
  {
    int dado2 = Wire.read(); // receive a byte as character
    Serial.print(dado2);         // print the character
    
  switch(dado2){

  case 1:
 
  digitalWrite(e1,HIGH);
  delay(1000);
  digitalWrite(e1,LOW);
  delay(1000);
  break;
  case 2:
   digitalWrite(a1,HIGH);
     digitalWrite(g1,HIGH);
  delay(1000);
  digitalWrite(a1,LOW);
  digitalWrite(g1,LOW);

  break;
  case 3:
     digitalWrite (a1,HIGH);
  digitalWrite (g1,HIGH);
  digitalWrite (e1,HIGH);
  delay ( 1000);
   digitalWrite (a1,LOW);
  digitalWrite (g1,LOW);
  digitalWrite (e1,LOW);
  break;
  case 4:
   digitalWrite (a1,HIGH);
  digitalWrite (c1,HIGH);
  digitalWrite (d1,HIGH);
  digitalWrite (g1,HIGH);
  delay ( 1000);
  digitalWrite (a1,LOW);
  digitalWrite (c1,LOW);
  digitalWrite (d1,LOW);
  digitalWrite (g1,LOW);
  break;
  case 5:
    digitalWrite (a1,HIGH);
  digitalWrite (c1,HIGH); 
  digitalWrite (d1,HIGH);
  digitalWrite (g1,HIGH);
  digitalWrite (e1,HIGH);
  delay (1000);
  digitalWrite (a1,LOW);
  digitalWrite (c1,LOW); 
  digitalWrite (d1,LOW);
  digitalWrite (g1,LOW);
  digitalWrite (e1,LOW);
  break;
  case 6:
  digitalWrite (a1,HIGH);
  digitalWrite (b1,HIGH);
  digitalWrite (c1,HIGH);
  digitalWrite (d1,HIGH);
  digitalWrite (g1,HIGH); 
  digitalWrite (f1,HIGH);
  delay (1000); 
   digitalWrite (a1,LOW);
  digitalWrite (b1,LOW);
  digitalWrite (c1,LOW);
  digitalWrite (d1,LOW);
  digitalWrite (g1,LOW);
  digitalWrite (f1,LOW);
  break;
  }
}
 
while (ganador==0){
jugador1=dado1+dado2;
 jugador2=dado1+dado2;
 jugador3=dado1+dado2;
 jugador4=dado1+dado2;
 
  if (jugador1==100){
    ganador=jugador1;
    ganador=1;
  }
  if(jugador2==100){
    ganador=jugador2;
    ganador=1;
  }
    if(jugador3==100){
    ganador=jugador3;
    ganador=1;
  }
    if(jugador4==100){
    ganador=jugador4;
    ganador=1;
  }
  
}
}



