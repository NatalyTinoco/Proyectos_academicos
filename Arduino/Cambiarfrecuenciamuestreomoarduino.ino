// Arrays to save our results in
unsigned long start_times[100];
unsigned long stop_times[100];
unsigned long values[100];


// Define various ADC prescaler
const unsigned char PS_2 = (1 << ADPS0);
const unsigned char PS_4 = (1 << ADPS1);
const unsigned char PS_8 = (1 << ADPS1)| (1 << ADPS0);;
const unsigned char PS_16 = (1 << ADPS2);
const unsigned char PS_32 = (1 << ADPS2) | (1 << ADPS0);
const unsigned char PS_64 = (1 << ADPS2) | (1 << ADPS1);
const unsigned char PS_128 = (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);

// Setup the serial port and pin 2
void setup() {
  Serial.begin(9600);
  pinMode(2, INPUT);

  // set up the ADC
  ADCSRA &= ~PS_128;  // remove bits set by Arduino library

  // you can choose a prescaler from above.
  // PS_16, PS_32, PS_64 or PS_128
  ADCSRA |= PS_64;    // set our own prescaler to 64 

}


void loop() {  
  unsigned int i;

  // capture the values to memory
  for(i=0;i<100;i++) {
    start_times[i] = micros();
    values[i] = analogRead(2);
    stop_times[i] = micros();
  }

  // print out the results
  for(i=0;i<100;i++) {
    Serial.print(values[i]);
    Serial.print(", ");
    Serial.println(stop_times[i] - start_times[i]);
  }
}
