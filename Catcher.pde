class Catcher {
  float diam;//thus set up the diameter for the intersection
  float diam2=30;
  color col; // color
  float x,y,y3; // location
  float speed=5;// speed
  float y2=600;// location
  
  Catcher(float tempR) {
    diam = tempR;  //temporary class
    col = color(255);
 
  }
  
  void setLocation(float tempX, float tempY) {
    x = tempX; //this sets the location of the catcher
    y = tempY;
  }
  


  void display() {
    stroke(0);
    fill(col);
    image(img2,x,y,diam,diam);
      if (x > width-20 )              // if the spaceship hits the side, it will moved to the other side of the screen
  {
    x=+30;                                  //If it did reverse the direction
  }
        if (x < 20 )                //Did the spaceship hit the side?
  {
    x=+580;                                  //If it did reverse the direction
  }
     if (y > height-20 )                //Did the spaceship hit the side?
  {
   
   
    y=+30;                                  //If it did reverse the direction
  }
        if (y < 20 )                //Did the spaceship hit the side?
  {
    y=+580;                                  //If it did reverse the direction
  }
   image(img14,x+19,y2,12,12);
  

    
   if(key=='s')//if the s key is pressed the bullet will go off
   {
  
    y2 -= speed;
 
   }
     
   if(key!='s')//if it's not the s key it will go to the x direction
   {
     y2=y;
   }
   
  if(y2<10)// if it goes above 10 it will go to the y direction
    {
     y2=y;
       }
   }
  
  
  
  
    void display2()
  {
    image(img14,x,y3,20,20);//these displays the cannons
    image(img14,x-300,y3,20,20);
   
  }
  
 
  void mousePressed()
   {
    if(mousePressed==false)//if mousepressed is false the bullets will keep going
   {
    y3 -= speed; //it moves at that speed
   }
   
     if(y3<10)//if it goes above that height, it is returned to 570
    {
     y3=570;
       }
   
   } 
  
  
   void keyPressed(){
     if(!keyPressed)// this will make sure the keypressed function is constantly updated
     {
       return;
     }
  if (key==CODED)
  {
    if(keyCode ==LEFT){
      
      x=x-7;// it will move  the x position to the left
    }
    if
        (keyCode ==RIGHT){
      x=x+7;// it will move  the x position to the right
         }
  if
        (keyCode ==UP){
      y-=7;// it will move  the y position to the top
         }
  if
        (keyCode ==DOWN){
      y+=7;// it will move the y position to the bottom
         }
  }
}
  
  // A function that returns true or false based on
  // if the catcher intersects an alien
  boolean intersect(Alien d) {
    // Calculate distance
    float distance = dist(x,y,d.x,d.y);//this sets up the distance between the catcher and the alien 
    
    // Compare distance to sum of diameters between the two and if they fit, say true
    if (distance < diam) { 
      return true;
    } else {
      return false;
    }
  }
    boolean intersect2(Alien d) {
    // Calculate distance
    float distance = dist(x,y,d.x3,d.y3); //this sets up the distance between the catcher and the alien 
    
   // Compare distance to sum of diameters between the two and if they fit, say true
    if (distance < diam) { 
      return true;
    } else {
      return false;
    }
  }
   boolean intersect3(Alien d) {
    // Calculate distance
    float distance = dist(x,y3,d.x,d.y); //this sets up the distance between the catcher and the alien 

    if (distance < diam) { 
      return true;
    } else {
      return false;
    }
  
  }
    boolean intersect4(Alien d) {
    // Calculate distance
    float distance = dist(x-300,y3,d.x,d.y); //this sets up the distance between the catcher and the alien 
    // Compare distance to sum of radii
    if (distance < diam) { 
      return true;
    } else {
      return false;
    }
  
  }
     boolean intersect5(Alien d) {
    // Calculate distance
    float distance = dist(x,y2,d.x,d.y);  //this sets up the distance between the catcher and the alien 
    // Compare distance to sum of radii
    if (distance < diam2) { 
      return true;
    } else {
      return false;
    }
     }
        boolean intersect6(Alien d) {
    // Calculate distance
    float distance = dist(x,y2,d.x3,d.y3);  //this sets up the distance between the catcher cannon and the alien 
    // Compare distance to sum of radii
    if (distance < diam2) { 
      return true;
    } else {
      return false;
    }
        }
             boolean intersect7(Alien d) {
    // Calculate distance
    float distance = dist(x,y3,d.x3,d.y3);  //this sets up the distance between the catcher cannon and the alien 
    // Compare distance to sum of radii
    if (distance < diam2) { 
      return true;
    } else {
      return false;
    }
             }
                 boolean intersect8(Alien d) {
    // Calculate distance
    float distance = dist(x-300,y3,d.x3,d.y3);  //this sets up the distance between the catcher cannon and the alien 
    // Compare distance to sum of radii
    if (distance < diam2) { 
      return true;
    } else {
      return false;
    }
}
}
