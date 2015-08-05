class Alien {
  float x,y,y2,x3,y3;   // Variables for the aliens
   
  color c;     // color of the alien
 float speed; //speed of the aliens
  Alien() {
                 
    x = random(0,550);     // Start with a random x location
    y = -20;
    y2= -20;
    x3=-20;
    y3=random(0,550);
    // Start a little above the window
    
     // Color
  }

  void update(float tempx){
    speed=tempx;
  
    // Increment the speed of the aliens
    y += speed; 
    y2 +=speed;
    x3 +=speed;
  }

  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (y > height) { 
      return true; //if turns true it returns a height offscreen
    } else {
      return false;
    }
  }
  
   boolean reachedBottom2() {
     // If we go a little beyond the bottom
    if (y2 > height) { 
      return true;//if turns true it returns a height offscreen
    } else {
      return false;
    }
  }
    boolean reachedBottom3() {
      // If we go a little beyond the bottom
    if (x3 > width) { 
      return true;//if turns true it returns a height offscreen
    } else {
      return false;
    }
  }

  // Display the black aliens
  void display() {
    fill(0);
    noStroke();
    for (int i = 2; i < 8; i++ ) {
      image(img5,x,y ,60,60);
    }
  }

  void display2() {
    // Display the red aliens
    fill(255,0,0);
    noStroke();
    for (int i = 2; i < 8; i++ ) {
      image(img3,x,y2 ,50,50);
    }
  }
  
    void display3() {
    // Display the blue aliens
    fill(0,0,255);
    noStroke();
    for (int i = 2; i < 4; i++ ) {
      image(img4,x,y ,50,50);
    }
  }
     void display4() {
    // Display the green aliens
    fill(0,255,0);
    noStroke();
    for (int i = 2; i < 4; i++ ) {
      image(img9,x3,y3 ,40,40);
    }
  }
  // If the alien is caught
  void caught() {
    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen
    y = - 20000;//  might change to x
    y2= -20060; 
    x3= -30000;
}
}
