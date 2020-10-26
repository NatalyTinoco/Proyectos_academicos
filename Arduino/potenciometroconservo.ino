int servo=7;
int valorpot;

void setup() {
   // TCCR1B = TCCR1B & B11111000 | B00000001; // Set PWM frequency for D9 & D10 :   
    pinMode(servo, OUTPUT); // sets the pin as outpu

}

void loop() {
  // put your main code here, to run repeatedly:
valorpot=analogRead(A1);
valorpot = map ( valorpot , 0 , 1023 , 470 ,  2050) ; 
 for (int Hz =0; Hz < 50 ;Hz++){     // repetimos la instruccion 50 veces
      digitalWrite (servo,HIGH);
      delayMicroseconds(valorpot);    
      digitalWrite (servo,LOW);
      delay(19);
     }
}
