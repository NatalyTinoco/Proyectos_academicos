int contador = 0;   // Variable entera que se almacena en la RAM del Micro
int pin=9;
int con=0;
long f;
long valorcontrol;
int valorusuario;
long tiempo1;
long tiempo2;
long resta;
long error;
int pwm=80;
int sumapwm;
float k=0.027;
void setup() {
   Serial.begin(9600);
  pinMode(pin,OUTPUT);
  pinMode(2,INPUT);
  attachInterrupt(0,interrupcion0,RISING);  // Interrupcion 0 (pin2) 
  Serial.println("Indique la velocidad en RPM que desea");
}  
// LOW, CHANGE, RISING, FALLING
 
void loop() {
if (Serial.available()>0){
//leemos la opcion enviada
valorusuario= Serial.parseInt();
Serial.print("Velocidad:  "); 
Serial.println(valorusuario); 
//tiempo = millis();
pwm=valorusuario*k;

error=abs(valorusuario-valorcontrol);
if (error>10){
pwmsuma=pwmsuma+2;
pwm=pwm+pwmsuma;
}else{
Serial.print("diferencia"); 
Serial.println(y);   
}   
if (pwm>=255){
  pwm=255;                                                              
}if(pwm<=29){
  pwm=29;
}
analogWrite(pin,pwm);
}

 
void interrupcion0() {   // Funcion que se ejecuta durante cada interrupio{
  
if(contador>=60){
  tiempo2=micros();  
  resta=abs(tiempo2-tiempo1);
  f=(resta/3);
  valorcontrol=(60000000/f);
  Serial.println(valorcontrol);  
  contador=0;   
}
if (contador==0){
  tiempo1=micros();
}
contador++;
// Se incrementa en uno el contador
}
}

