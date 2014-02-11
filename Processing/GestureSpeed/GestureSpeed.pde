import com.leapmotion.leap.SwipeGesture;
import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Hand;
import com.leapmotion.leap.Gesture.Type;
import com.leapmotion.leap.Gesture.State;

LeapMotionP5 leap;

String lastGesture = "";

public void setup() {
  size(500, 500);
  textSize(17);

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

