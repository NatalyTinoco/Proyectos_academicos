// Wire Master Reader
// by Nicholas Zambetti <http://www.zambetti.com>

// Demonstrates use of the Wire library
// Reads data from an I2C/TWI slave device
// Refer to the "Wire Slave Sender" example for use with this

// Created 29 March 2006

// This example code is in the public domain.
#include <LiquidCrystal.h>

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
#include <Wire.h>
int a=22;
int b=24;
int c=26;
int d=28;
int e=30;
int f=32;
int g=34;
int dado1;
int Ganador=30;
int ganador=0;

void setup()
{
    // set up the LCD's number of columns and rows:
lcd.begin(16, 2);
  // Print a message to the LCD.

   lcd.print("Universidad");
    lcd.setCursor(0,1);
    lcd.print("El Bosque");
    delay(2000);
    lcd.clear();
    lcd.print("    Escalera  ");
     delay(2000);
    lcd.clear();
    lcd.print("  Comenzo");
    lcd.setCursor(0,1);
    lcd.print("el juego");
    delay(2000);
    lcd.clear();
    lcd.print("Lanza el dado");
    delay(2000);
    lcd.clear();
  Wire.begin();        // join i2c bus (address optional for master)
  Serial.begin(9600);  // start serial for output

  pinMode (a,OUTPUT); //declaramos el led como salida
  pinMode (b,OUTPUT); 
  pinMode (c,OUTPUT); 
  pinMode (d,OUTPUT); 
  pinMode (e,OUTPUT); 
  pinMode (f,OUTPUT); 
  pinMode (g,OUTPUT);  
  
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
int posicion1=0;
int posicion2=0;
int posicion3=0;
while (ganador==0){
      posicion1= posicion1 + dado1;
      posicion2= posicion2 + dado1;
      posicion3= posicion3 + dado1;

       if (posicion1==10){
        posicion1=posicion1+5;
       lcd.print("sube escalera jugador 1");
       lcd.setCursor(0,1);
       lcd.print ("queda en la posición:" +(posicion1));
       delay (1000);
      }
      if (posicion2==10){
        posicion2=posicion2+5;
        lcd.print("sube escalera jugador 2");
       lcd.setCursor(0,1);
       lcd.print (" queda en la posición:" +(posicion2));
        delay (1000);
      }
      if (posicion3==10){
        posicion3=posicion3+5;
       lcd.print("sube escalera jugador 3");
        lcd.setCursor(0,1);
       lcd.print ("queda en la posición:" +(posicion3));
        delay (1000);
      }

       if (posicion1==20){
        posicion1=posicion1+3;
       lcd.print("sube escalerajugador 1");
        lcd.setCursor(0,1);
       lcd.print ("queda en la posición:" +(posicion1));
        delay (1000);
      }
       if (posicion2==20){
        posicion2=posicion2+3;
        lcd.print("sube escalera jugador 2");
        lcd.setCursor(0,1);
       lcd.print ("queda en la posición:" +(posicion2));
        delay (1000);
      }
       if (posicion3==20){
        posicion3=posicion3+3;
      lcd.print ("sube escalera jugador 1");
        lcd.setCursor(0,1);
       lcd.print ("queda en la posición:" +(posicion3));
        delay (1000);
      }

       if (posicion1==28){
        posicion1=posicion1-10;
        lcd.print("baja escalera jugador 1");
        lcd.setCursor(0,1);
       lcd.print ("queda en la posición:" +(posicion1));
        delay (1000);
      }
       if (posicion2==28){
        posicion2=posicion2-10;
        lcd.print("baja escalerajugador 2");
        lcd.setCursor(0,1);
       lcd.print ("queda en la posición:" +(posicion2));
        delay (1000);
      }
       if (posicion3==28){
        posicion3=posicion3-10;
       lcd.print("baja escalera jugador 3");
        lcd.setCursor(0,1);
        lcd.print ("queda en la posición:" +(posicion3));
        delay (1000);
      }
      
        if ( posicion1 >= Ganador){
        lcd.print("Jugador 1");
        lcd.setCursor(0,1);
       lcd.print ("¡¡Ganador del juego!!");
        delay (1000);
          ganador=1;
        }
        if (posicion2 >= Ganador){
         lcd.print("Jugador 2");
         lcd.setCursor(0,1);
       lcd.print ("¡¡Ganador del juego!!");
        delay (1000);
          ganador=1;
          }
          if (posicion3 >= Ganador){
       lcd.print("Jugador 3");
         lcd.setCursor(0,1);
       lcd.print ("¡¡Ganador del juego!!");
        delay (1000);
          ganador=1;
           }
      if ((posicion1>=Ganador)&&(posicion2>=Ganador)&&(posicion3>=Ganador)){
         lcd.print("Empate");
           lcd.setCursor(0,1);
           lcd.print (" jugador 1, 2 y 3");
            delay (1000);
      }
           else  if ((posicion1>=Ganador)&&(posicion2>=Ganador)){
         lcd.print("Empate");
         lcd.setCursor(0,1);
         lcd.print (" jugador 1 y 2");
          delay (1000);
       }
       else if ((posicion1>=Ganador)&&(posicion3>=Ganador)){
        lcd.print("Empate");
         lcd.setCursor(0,1);
       lcd.print (" jugador 1 y 3");
        delay (1000);
       }
       else  if ((posicion2>=Ganador)&&(posicion3>=Ganador)){
        lcd.print("Empate");
         lcd.setCursor(0,1);
       lcd.print (" jugador 2 y 3");
        delay (1000);
       }
    
       if ((posicion1>= Ganador)||( posicion2>= Ganador)||( posicion3 >= Ganador)){
        lcd.print("¡¡Fin del Juego!!");
       }
       }
        }
    
  }








