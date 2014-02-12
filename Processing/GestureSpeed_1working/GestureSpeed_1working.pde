import com.leapmotion.leap.SwipeGesture;
import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Hand;
import com.leapmotion.leap.Gesture.Type;
import com.leapmotion.leap.Gesture.State;
import processing.serial.*;
import cc.arduino.*;

int pos = 0;

Arduino arduino;
LeapMotionP5 leap;

String lastGesture = "";

public void setup() {
  size(500, 500);
  textSize(17);
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  leap = new LeapMotionP5(this);
}


public void draw() {
  background(0);
  for (Hand hand : leap.getHandList()) {
    PVector handPos = leap.getPosition(hand);
    ellipse(handPos.x, handPos.y, 10, 10);
  }
  
   text(lastGesture, 30, 30);
  
}

public void swipeGestureRecognized(SwipeGesture gesture) {
  if (gesture.state() == State.STATE_STOP) {
//    System.out.println("//////////////////////////////////////");
//    System.out.println("Gesture type: " + gesture.type());
//    System.out.println("ID: " + gesture.id());
//    System.out.println("Position: " + leap.vectorToPVector(gesture.position()));
//    System.out.println("Direction: " + gesture.direction());
//    System.out.println("Duration: " + gesture.durationSeconds() + "s");

    System.out.println("//////////////////////////////////////");
    System.out.println("Speed: " + gesture.speed());
//    lastGesture = "Gesture type: " + gesture.type().toString() + "\n";
//    lastGesture += "ID: " + gesture.id() + "\n";
//    lastGesture += "Position: " + leap.vectorToPVector(gesture.position()) + "\n";
//    lastGesture += "Direction: " + gesture.direction() + "\n";
    lastGesture = "Speed: " + gesture.speed() + "\n";
//    lastGesture += "Duration: " + gesture.durationSeconds() + "s" + "\n";


if (gesture.speed() >=2000) {     
    System.out.println("Te snel!");
}

else if (gesture.speed() >=800) {
    System.out.println("Snel genoeg");
    text("snel genoeg!", 60,60);
    delay (5000);
    piston();
}

else {
    System.out.println("Te traag!");
}


  } 
  else if (gesture.state() == State.STATE_START) {
  } 
  else if (gesture.state() == State.STATE_UPDATE) {
  }
}

public void keyPressed() {
    if (leap.isEnabled(Type.TYPE_SWIPE)) {
      leap.disableGesture(Type.TYPE_SWIPE);
      lastGesture = "";
    } 
    else {
      leap.enableGesture(Type.TYPE_SWIPE);
      lastGesture = "";
   }
}

public void stop() {
  leap.stop();
}










void piston() {
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
  }

