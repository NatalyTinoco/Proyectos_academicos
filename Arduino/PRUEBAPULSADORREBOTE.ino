
void setup() {
DDRE=32;// VALOR DE 2 A LA n DE PE5
PORTE=16;//VALOR DE 2 A LA n DE PE4. VALOR DEL BIT

}

void loop() {
  if ( PINE^(1 << 4)){
   PORTE|=32;
  }else{
    PORTE&=~32;
  }
}

