//importing library(Theres alot of code above which you can't see)
import processing.serial.*;

// Variables
Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port

void setup() 
{
  size(1280, 720);
  printArray(Serial.list());
  String portName = Serial.list()[0]; // Change this to whatever port you are using (check in the arduino IDE: filemenu > tools > port)
  myPort = new Serial(this, portName, 9600);
  
  //Shooter is the example program (see the other tab)
  setupShooter();
}

// Runs 60 times a second - looped
void draw()
{
  if ( myPort.available() > 0)   // If data is available,
  {                             
    val = myPort.read();         // read it and store it in val
  }

  //Shooter is the example program (see the other tab)
  shooterDrawLoop();
}