
int numero,  digito, cont;
double binario, ex, base;//variables para hacer funciones de numeros decimales
int leds[8];//matriz de 8 led
int led1 = 3, led2 = 4, led3 = 5, led4 = 6, led5 = 7, led6 = 8, led7 = 9, led8 = 10; //variables con su numero de led

void setup(){
  Serial.begin(9600);

  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT);
  pinMode(led4, OUTPUT);
  pinMode(led5, OUTPUT);
  pinMode(led6, OUTPUT);
  pinMode(led7, OUTPUT);
  pinMode(led8, OUTPUT);
  Serial.println("introduce un numero");

}

void loop(){
    while(numero < 0);//condicion while que                                                                          
    base = 10;
    ex=0;
    cont=0;
    binario=0;
    leds[7]=0;
    leds[6]=0;
    leds[5]=0;
    leds[4]=0;
    leds[3]=0;
    leds[2]=0;
    leds[1]=0;
    leds[0]=0;
    while(numero != 0 ){
     digito = numero % 2;
     binario =  binario + digito * Exp(base,ex)  ;
     leds[cont]= digito;
     ex++;
     cont++;
     numero = numero/2;
        digito = 0;
    }
    Serial.println(binario); 
    digitalWrite(led8,leds[7]);
    digitalWrite(led7,leds[6]);
    digitalWrite(led6,leds[5]);
    digitalWrite(led5,leds[4]);
    digitalWrite(led4,leds[3]);
    digitalWrite(led3,leds[2]);
    digitalWrite(led2,leds[1]);
    digitalWrite(led1,leds[0]);
    
    delay(1000);
    Serial.println("introduce un numero");
  }
}

double Exp ( double base, double exponente ){
double respuesta = 1;

for(int i = 1; i <= exponente; i++){
respuesta = respuesta * base;

}

