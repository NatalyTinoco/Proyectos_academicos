const int poten=A1;
int x=0; //Almacena los Bits de la entrada analógica 
int pin1=3;
int pin2=7;
int estadoactual2=0;
int estadoanterior2=1;
int estadoactual1=0;
int estadoanterior1=1;
int contador1=0;
int contador2=0;
int flexion=0;
int extension=0;
int b=0;
int a=0;
void setup() {
  // put your setup code here, to run once:
Serial.begin (9600);
}

void loop() {
  // put your main code here, to run repeatedly:
x= analogRead(poten);
estadoactual1=digitalRead(pin1);
estadoactual2=digitalRead(pin2);
//Serial.print(estadoactual1);
//Serial.println(estadoactual2);
if (estadoactual1!= estadoanterior1) {
 if (estadoactual1 == 1) {
  contador1++;
  if (contador1==1){
  extension=x; 
  a=1;
  contador1=0;
}
 }
}
      
estadoanterior1=estadoactual1;
//Serial.print(estadoactual);
//Serial.println(estadoanterior);
if (estadoactual2!= estadoanterior2) {
 if (estadoactual2 == 1) {
  contador2++;
  if (contador2==1){
    contador2=0;
    flexion=x; 
    b=1;
    }
}
}        
 estadoanterior2=estadoactual2;
 if (a==1 && b==1){
Serial.print(extension);
Serial.print(',');
Serial.println(flexion);
delay(10);
a=0;
b=0;
 }

}



