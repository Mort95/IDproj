// digital pin 2 has the pushbutton attached to it. Give it a name:(black: gnd, red: 5v, green: 2)
int pushButton = 2;
int led = 13;

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  // make the pushbutton's pin an input:
  pinMode(pushButton, INPUT_PULLUP);
  pinMode(led, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input pin:
  int buttonState = digitalRead(pushButton);
  // light up pin 13 if the state of the button is 1:
  digitalWrite(led, buttonState);

  if (buttonState == 0)
    Serial.write(0);
  else
    Serial.write(1);

  delay(100);        // delay in between reads for stability IMPORTANT: processing needs 100 milliseconds or the data will be corrupted
}



