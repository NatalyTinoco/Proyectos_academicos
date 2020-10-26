
#include <Keypad.h>
#include <EEPROM.h>
byte dato2; //va a ser el byte a recibir

const byte Filas = 4; 		
const byte Cols = 4; 		
byte dato;

byte Pins_Filas[] = {9, 8, 7, 6};	 
byte Pins_Cols[] = {5, 4, 3, 2}; 	
char Teclas [ Filas ][ Cols ] = 
{
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','C'},
  {'*','0','#','D'}
};

Keypad Teclado1 = Keypad(makeKeymap(Teclas), Pins_Filas, Pins_Cols, Filas, Cols);
void setup(){
  Serial.begin(9600) ; 
  pinMode (13,OUTPUT);
  pinMode (12,OUTPUT);}
void loop()

{	  char pulsacion = Teclado1.getKey() ; 
if (pulsacion !=0)
      Serial.println(pulsacion);
       if(dato==1){
      digitalWrite(13, HIGH);   // enciende el LED
      delay(1000);                  // espera por un segundo
      }else{
      digitalWrite(13, LOW);    // apaga el LED
      delay(400);
      }
       if(dato2==1){
      digitalWrite(12, HIGH);   // enciende el LED
      delay(1000);                  // espera por un segundo
      }else{
      digitalWrite(12, LOW);    // apaga el LED
      delay(400);
      }
  }
      

