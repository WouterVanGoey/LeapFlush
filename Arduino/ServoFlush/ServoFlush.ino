// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.


#include <Servo.h> 
 
Servo myservo;  // create servo object to control a servo 
                // a maximum of eight servo objects can be created 
 
int pos = 0;    // variable to store the servo position 
bool done = false;

void setup() 
{ 
  myservo.attach(11);  // attaches the servo on pin 9 to the servo object 
  myservo.write(10);  // Starts the linear servo at safe distance
  delay(15);    
} 
 
 
void loop() 
{ 
  
  if (!done) {
    for(pos = 0; pos < 90; pos += 1)  // goes from 0 degrees to 90 degrees 
    {                                  // in steps of 1 degree 
      myservo.write(pos);              // tell servo to go to position in variable 'pos' 
      delay(15);                       // waits 15ms for the servo to reach the position 
    } 
    for(pos = 90; pos>=1; pos-=1)     // goes from 90 degrees to 0 degrees 
    {                                
      myservo.write(pos);              // tell servo to go to position in variable 'pos' 
      delay(15);                       // waits 15ms for the servo to reach the position 
    } 
    done = true;
  }
} 
