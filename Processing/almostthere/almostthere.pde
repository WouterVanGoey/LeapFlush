import processing.serial.*;
import cc.arduino.*;

int pos = 0;     // variable to store the servo position 
boolean done = false;

Arduino arduino;

void setup() {
  background (0);
  size(100, 100);
  arduino = new Arduino(this, Arduino.list()[0], 57600);
}

void draw() {
  
  if (!done) {
    for(pos = 0; pos < 180; pos += 1)  // goes from 0 degrees to 180 degrees 
    {                                  // in steps of 1 degree 
      arduino.analogWrite(11,pos);              // tell servo to go to position in variable 'pos' 
         println (pos);
         text (pos,20,20);
    } 
    
    for(pos = 180; pos>=1; pos-=1)     // goes from 180 degrees to 0 degrees 
    {                                
      arduino.analogWrite(11,pos);              // tell servo to go to position in variable 'pos' 
         println (pos);
         text (pos,20,20);
    } 
    

    done = true;
  }
  
}

