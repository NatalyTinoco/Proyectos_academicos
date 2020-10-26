int pin1=3;
int pin2=4;
int servo=7;
int estadoactual2=0;
int estadoanterior2=1;
int estadoactual1=0;
int estadoanterior1=1;
int contador=0;
int contador2=0;
int horario=131.6;//170.83; 
int antihorario=227.77;
int angulo=0;
void setup()
{
Serial.begin(9600);  // Abre la conexión con el puerto de serie
// Todos los pines en modo salida
pinMode(pin1, INPUT);
pinMode(pin2, INPUT);
pinMode(servo,OUTPUT);
}
  
void loop(){
estadoactual1=digitalRead(pin1);
estadoactual2=digitalRead(pin2);
//Serial.print(estadoactual);
//Serial.println(estadoanterior);
if (estadoactual1!= estadoanterior1) {
 if (estadoactual1 == 0) {
  contador++;
  if (contador==1 && contador2==0){
      angulo=2050;
      for (int Hz =0; Hz < 50 ;Hz++){     // repetimos la instruccion 50 veces
      digitalWrite (servo,HIGH);
      delayMicroseconds(angulo);         
      digitalWrite (servo,LOW);
      delay(19);
     } 
    angulo=angulo-horario;   
     for (int Hz =0; Hz < 50 ;Hz++){     // repetimos la instruccion 50 veces
      digitalWrite (servo,HIGH);
      delayMicroseconds(angulo);    
      digitalWrite (servo,LOW);
      delay(19);
     }
  }else{
     angulo=angulo-horario;   
      for (int Hz =0; Hz < 50 ;Hz++){     // repetimos la instruccion 50 veces
      digitalWrite (servo,HIGH);
      delayMicroseconds(angulo);             
      digitalWrite (servo,LOW);
      delay(19);
     }   
     }
 }
      
estadoanterior1=estadoactual1;
}

if (estadoactual2!= estadoanterior2) {
 if (estadoactual2 == 0) {
  contador2++;
  if (contador2==1&& contador==0){
      angulo=470;
      for (int Hz =0; Hz < 50 ;Hz++){     // repetimos la instruccion 50 veces
      digitalWrite (servo,HIGH);
      delayMicroseconds(angulo);         
      digitalWrite (servo,LOW);
      delay(19);
     } 
    angulo=angulo+antihorario;   
     for (int Hz =0; Hz < 50 ;Hz++){     // repetimos la instruccion 50 veces
      digitalWrite (servo,HIGH);
      delayMicroseconds(angulo);    
      digitalWrite (servo,LOW);
      delay(19);
     Serial.println(angulo);
     }
  }else{
     angulo=angulo+antihorario;   
      for (int Hz =0; Hz < 50 ;Hz++){     // repetimos la instruccion 50 veces
      digitalWrite (servo,HIGH);
      delayMicroseconds(angulo);             
      digitalWrite (servo,LOW);
      delay(19);
     }   
     }
 }
      
estadoanterior2=estadoactual2;
}

if (angulo>=2051){
if (contador>1 || contador2>1){
 angulo=470;
 for (int Hz =0; Hz < 50 ;Hz++){     // repetimos la instruccion 50 veces
      digitalWrite (servo,HIGH);
      delayMicroseconds(angulo);         
      digitalWrite (servo,LOW);
      delay(19);
     } 
}
}

if (angulo<=469){
if (contador>1 || contador2>1){
 angulo=2050;
 for (int Hz =0; Hz < 50 ;Hz++){     // repetimos la instruccion 50 veces
      digitalWrite (servo,HIGH);
      delayMicroseconds(angulo);         
      digitalWrite (servo,LOW);
      delay(19);
     } 
}
}
}
