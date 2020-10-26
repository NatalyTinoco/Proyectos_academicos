const int poten=A1;
float x=0; //Almacena los Bits de la entrada analógica
float y=0; 
float potenGrados=0;
int pin1=3;
int pin2=7;
int estadoactual2=0;
int estadoanterior2=1;
int estadoactual1=0;
int estadoanterior1=1;
int contador1=0;
int contador2=0;
float flexion=0;
float extension=0;
int b=0;
int a=0;
void setup() {
  // put your setup code here, to run once:
Serial.begin (9600);
}

void loop() {
  // put your main code here, to run repeatedly:
x= analogRead(poten);
x= x*5/1023; //% de rotación
//potenGrados= map(potenValor, 0, 1023);//Grado de rotación
if (x==0){
  y=0;
}
if (x!=0 && x<=0.1){
  y=10;
}
if (x>0.10){
y=(54.376)*x + 8.1299;
}
//Serial.println("......................");
//Serial.print("Grados: ");
//Serial.println(y);
delay (100);

estadoactual1=digitalRead(pin1);
estadoactual2=digitalRead(pin2);
//Serial.print(estadoactual1);
//Serial.println(estadoactual2);
if (estadoactual1!= estadoanterior1) {
 if (estadoactual1 == 1) {
  contador1++;
  if (contador1==1){
  extension=y; 
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
    flexion=y; 
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



