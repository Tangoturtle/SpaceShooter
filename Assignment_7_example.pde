//C13446122 Processing Assignment
// 4/11/14


//rules and controls for the game

// You use the arrow keys to make the spaceship move
// if you press the 's' key, it will shoot a bullet
//if you interact with the black alien, you lose a life
// if you interact with the red alien, you gain a point
// if you interact with the blue alien, you gain a life
// if you get a green alien, it gives a power, if you get six it will slow down the aliens


import ddf.minim.* ;  ///this is where I declare variables for sound in the game
Minim minim;
Minim minim2;
AudioPlayer au_player1;
AudioPlayer au_player2;
AudioPlayer au_player3;
AudioPlayer au_player4;

//this is where I declare the classes I made in the other tabs
Catcher catcher; //  catcher object
Catcher catcher2;//  catcher object
Catcher catcher3;//  catcher object
Timer timer;        // One timer object
Alien[] squares;   
Alien[] squares2;
Alien[] squares3;
Alien[] squares4;
Alien alien;// this is where we declare all the alien squares that are falling



int totalSquares = 0; 
int lives;
float stage;
float bx, by, bx2, by2, bx3, by3, bx4,by4; //this is the variables for the menu boxes
float w, h;
int power;
boolean lost=false;  // this boolean asks if you lost
int boxSize = 75;
PFont title;
PImage img, img2,img3,img4,img5,img6,img7,img8,img9,img10,img11,img12,img13,img14,img15,img16; //this is where we declare
int score;
float insane;// this is the variable for the hard mode
boolean overBox = false;
boolean locked = false;// makes sure the box is locked when starting
float xOffset = 0.0; // this sets the offset of the mouse
float yOffset = 0.0; // this sets the offset of the mouse
float gameover=0;




//this is what we declare when we start the program
void setup() {
  size(600,600);// it is 600 width size * 600 height size of the screen
   minim = new Minim(this) ;// this is where the sound files are loaded
   minim2 = new Minim(this) ;
 au_player1 = minim.loadFile(  "sc1.wav")  ;
 au_player2 = minim.loadFile(  "sc.wav")  ;
 au_player3 = minim.loadFile("1.mp3")  ;
 au_player4 = minim2.loadFile("2.mp3")  ;
 
 
// all the images that we will use in the program
img =loadImage("city.jpg");
img2 =loadImage("sprite.png");
img3 =loadImage("download1.png");
img4 =loadImage("sprite2.png");
img5 =loadImage("sprite3.png");
img6=loadImage("Space2.jpg");
img7=loadImage("start4.png");
img8=loadImage("arrows.png");
img9=loadImage("power.png");
img10=loadImage("main.png");
img11=loadImage("gameover.png");
img12=loadImage("tower.png");
img13=loadImage("Space2.jpg");
img14=loadImage("bullet.png");
img15=loadImage("gameover2.png");
img16=loadImage("s.png");


//this is where the aliens and the spaceship variables are declared
catcher = new Catcher(50); // these catchers will have a diameters declared at 50
catcher2 = new Catcher(50);
catcher3 = new Catcher(50);
squares = new Alien[1000]; // there will be an array of 1000 aliens
squares2 = new Alien[1000];
squares3 = new Alien[1000];
squares4 = new Alien[1000];



  timer = new Timer(500);   // this is a timer we will use to declare a new array after the the given time 
  timer.start();      // This starts the timer


  //these are the factors that play with how the game works 
  lives=3;
  stage=1;
  score=0;
  insane=0;
  
  title=createFont("font",500,true);
  
  bx = 100; by = 220;  bx2 = 480; by2 = 490;  bx3 = 500; by3 = 20; bx4 = 100; by4 = 370;  h=200;  w=100;
  
}





//this is where we draw the program
void draw() {
   
  // this is the screen that will display if the stage =1
  if (stage==1){
    image(img6,0,0); // we use this image in our splash screen
    textAlign(CENTER,BOTTOM);// this is where the text is aligned
    textSize(44);// the size of the text
    text("SPACE INVASION",290,80);
    textSize(32);// the size of text
    text("CAN YOU SURVIVE THE APOCALYPSE",290,130);
    text("Normal",250,260);
    text("Mode",250, 300);
    image(img2,350,240,50,50);// this is where the spaceship is displayed to make the splash screen more detailed
    text("Hard",230,410);
    text("Mode",233,450);
    image(img2,350,390,50,50);// this is where the spaceship is displayed to make the splash screen more detailed
    image(img2,410,390,50,50);// this is where the spaceship is displayed to make the splash screen more detailed
    text("Rules", 420, 555);    
    image(img7,bx, by, boxSize, boxSize);// this is where we use images to make the buttons look nicer
    image(img7,bx2,by2,boxSize, boxSize);// this is where we use images to make the buttons look nicer
    image(img7,bx4,by4,boxSize, boxSize);// this is where we use images to make the buttons look nicer
    
    
    //stage 2    normal mode
    // this is where we use the mousefunction to declare what stage we want to go to
    if (mousePressed== mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize)
      {  overBox = true;  //this is used to make sure the mouse clicks into the stage you selected
    if(!locked) {  
      stroke(255);  } 
   else {
    stroke(153);

      stage=2;// with this button pressed it declares to go stage two
        au_player2.play() ;// this will declare the sound when the button is pressed
      catcher.setLocation(280,500); 
        catcher3.setLocation(450,590); 
          overBox = false;    }
      }
      
      
      //stage 2++  hard mode
     //this is where the other button is placed and if the mouse presses it goes to that stage
     if (mousePressed== mouseX > bx4-boxSize && mouseX < bx4+boxSize && 
      mouseY > by4-boxSize && mouseY < by4+boxSize)
         { overBox = true;  
    if(!locked) { 
      stroke(255);  } 
   else {
    stroke(153);
    
      stage=2;// this button will go to stage  2
       au_player2.play() ;// this will declare the sound when the button is pressed
      catcher.setLocation(280,500); 
      catcher2.setLocation(340,500); // this addition will make this mode harder as you are declaring another spaceship
        catcher3.setLocation(450,590); 
        insane++; //this will be used to add the additional mechanics that aren't in normal mode (stage 2) 
        overBox = false; }
         }
  
  
      //stage3   the rules of the game
      //with this button pressed,it will bring you to the rules of the game
     if (mousePressed== mouseX > bx2-boxSize && mouseX < bx2+boxSize && 
      mouseY > by2-boxSize && mouseY < by2+boxSize)
   {   overBox = true;  
    if(!locked) { 
      stroke(255);  } 
   else {
    stroke(153);
  
      stage=3;//this brings you to stage 3
        overBox = false;}   }
}
  
  
  
  // if stage 2 was selected it brings you here
   if (stage==2){
      au_player3.play() ;
     tint(255,255,255);// this change the rate of the colours strength in the image
       image(img,-15,0,img.height/1.6,img.width/1.2);// this is the image that will be used in the main game
   noSmooth(); stroke(255); fill(255);  // these change the colours and sharpness in the game
  text("Lives:",50,50);
  text(lives, 50, 80);
 
 image(img12,440,565,40,40);// this declare the cannons at the bottom of the screen
 image(img12,140,565,40,40);// this declare the cannons at the bottom of the screen
 text("Score:",550,50);
 text(score, 550, 80);
 text("Power",550, 530);
 text("Level:",550,560);
 text(power, 550, 590);// this is the variable for the power level
  // textSize(24);
   text("Press's'",65,550);
  text("to shoot", 70, 580);
  // Set catcher location  Display the catcher
  catcher.display();
  catcher.keyPressed();

/// use this for insane mode stage 2++ as it declare the other spaceship
  if(insane==1)
  {
   catcher2.keyPressed();
  catcher2.display();
  }
  
  
  /// use this for insane mode
  if(score>=10 && score<=15 || score>=25 && score<=30)
  {
  catcher3.mousePressed();
  catcher3.display2();
  }
  
  
  
  
  
  // Check the timer
  if (timer.isFinished()) {
    // Deals with the falling Aliens rate at they appear
    // Initialize one Alien after the totalsquares is greater than the squares lenght which then restarts the totalsquares
    squares[totalSquares] = new Alien();
    squares2[totalSquares] = new Alien();
     squares3[totalSquares] = new Alien();
     squares4[totalSquares] = new Alien();
    // Increment totalsquares
    totalSquares ++ ;
    // If we hit the end of the array
    if (totalSquares >= squares.length) {
      totalSquares = 0; // Start over
    }
    timer.start(); //starts the timer
     if (totalSquares >= squares2.length) {
      totalSquares = 0; // Start over  
    }
    timer.start(); //starts the timer
      if (totalSquares >= squares3.length) {
      totalSquares = 0; // Start over
    }
    timer.start();
      if (totalSquares >= squares4.length) {
      totalSquares = 0; // Start over
    }
    timer.start();
  }
   
   
   //this will make sure you life counter go beyond 4
  if(lives>3)
  {
    lives=4;
  }
  
  
  // Move and display all black aliens
  for (int i = 0; i < totalSquares; i++ ) {
    if(score>=10)// if the score is greater than 10 it speeds up the aliens by 1
    {  squares[i].update(1);}
      if(score>=20)// if the score is greater than 130 it speeds up the aliens by 1
    {  squares[i].update(1); } 
     if(score>=30)// if the score is greater than 30 it speeds up the aliens by 1
    { squares[i].update(2);  }
      if(score>=35)// if the score is greater than 35 it speeds up the aliens by 2
    { squares[i].update(1);}
      if(power>=6)// if the powerlevel is greater than 6 it speeds down the aliens by 1
    { squares[i].update(-1);}
    
     
    squares[i].update(3); //this declare the initial speed of the aliens/squares
    squares[i].display();// this displays the alien
    if (catcher.intersect(squares[i])) {
      squares[i].caught();  // if the catcher interact with the alien , it moves the alien and causes you to lose alife
      lives--; }  
    if (catcher.intersect5(squares[i])) {
      squares[i].caught();  // if the catcher interact with the alien , it moves the alien and causes you to lose alife
             }
    
    // this declare the other spaceship if insane mode =1
    if(insane==1){
    if (catcher2.intersect(squares[i])) {
      squares[i].caught();// if the catcher interact with the alien , it moves the alien and causes you to lose alife
      lives--; } 
    if (catcher2.intersect5(squares[i])) {
      squares[i].caught();// if the catcher interact with the red alien, it causes you to gain a point
    } 
 
  }
  
  
  //if you get this score it causes the canon to goes off but they won't lose a life
     if(score>=10 && score<=15 || score>=25 && score<=30){   
    
    if (catcher3.intersect3(squares[i])) {
      squares[i].caught();  }
    if (catcher3.intersect4(squares[i])) {
      squares[i].caught();  }
  }}
  
  
  
   // Move and display all red aliens
   for (int i = 0; i < totalSquares; i+=4 ) {
  if(score>=10)// if the score is greater than 10 it speeds up the aliens by 1
    {      squares2[i].update(1);}
  if(score>=20)// if the score is greater than 20 it speeds up the aliens by 1
    {      squares2[i].update(1);  }
     
     
      squares2[i].update(3);//this declare the initial speed of the aliens/squares
      squares2[i].display2();// this causes the red aliens/square to move
    if (catcher.intersect(squares2[i])) {
      squares2[i].caught(); // if the catcher interact with the red alien, it causes you to gain a point
      score++;  }
      if (catcher.intersect5(squares2[i])) {
      squares2[i].caught();  // if the catcher interact with the alien , it moves the alien and causes you to lose alife
      score++;}
      // this declare the other spaceship if insane mode =1
     if(insane==1){
    if (catcher2.intersect(squares2[i])) {
      squares2[i].caught();// if the catcher interact with the red alien, it causes you to gain a point
      score++;  } 
       if (catcher2.intersect5(squares2[i])) {
      squares2[i].caught();// if the catcher interact with the red alien, it causes you to gain a point
      score++;  } 
  }
  
      
   //if you get this score it causes the canon to goes off and get a point  
     if(score>=10 && score<=15 || score>=25 && score<=30){
     
    if (catcher3.intersect3(squares2[i])) {
      squares2[i].caught();
      score++;}
    if (catcher3.intersect4(squares2[i])) {
      squares2[i].caught();
      score++;} 
   
    } 
  } 
  
  
  
   // Move and display all blue aliens
  for (int i = 0; i < totalSquares; i+=14 ) {
      if(score>=10)// if the score is greater than 10 it speeds up the aliens by 1
    {      squares2[i].update(1);}
  if(score>=20)// if the score is greater than 20 it speeds up the aliens by 1
    {      squares2[i].update(1);  }
    
    
     squares3[i].update(3);// this is the initial speed of the blue aliens
    squares3[i].display3();// this displays the blue aliens/squares and make them move
    if (catcher.intersect(squares3[i])) {
      squares3[i].caught();
      lives++; }
      if (catcher.intersect5(squares3[i])) {
      squares3[i].caught();  // if the catcher interact with the alien , it moves the alien and causes you to lose alife
       lives++;  }
       
    if(insane==1){
    if (catcher2.intersect(squares3[i])) {
      squares3[i].caught();// if the catcher interact with the blue alien, it causes you to gain a life
      lives++;  }
     if (catcher2.intersect5(squares3[i])) {
      squares3[i].caught();// if the catcher interact with the red alien, it causes you to gain a point
      lives++;  } }
      
         //if you get this score it causes the canon to goes off and get a point  
     if(score>=10 && score<=15 || score>=25 && score<=30){
     
    if (catcher3.intersect3(squares3[i])) {
      squares3[i].caught();
      lives++;}
    if (catcher3.intersect4(squares3[i])) {
      squares3[i].caught();
      lives++;} 
   
    } 
      
      
  } 
    
    
    // Move and display all green aliens
    for (int i = 0; i < totalSquares; i+=18 ) {
     squares4[i].update(2);//this sets the green aliens speed
    squares4[i].display4();// this displays them and tell them where to go
    if (catcher.intersect2(squares4[i])) {
      squares4[i].caught();// if the catcher interacts with the blue alien it puts up the power 
      power++;   }
    if (catcher.intersect6(squares4[i])) {
      squares4[i].caught();  // if the catcher interact with the alien , it moves the alien and causes you to lose alife
      power++;       }
      if(insane==1){
    if (catcher2.intersect2(squares4[i])) {
      squares4[i].caught();// if the catcher interact with the red alien, it causes you to gain a point
      power++;}  
    if (catcher2.intersect6(squares4[i])) {
      squares4[i].caught();// if the catcher interact with the red alien, it causes you to gain a point
      power++;  } }
      
      
     //if you get this score it causes the canon to goes off and get a point  
     if(score>=10 && score<=15 || score>=25 && score<=30){
     
    if (catcher3.intersect7(squares4[i])) {
      squares4[i].caught();
      power++;}
    if (catcher3.intersect8(squares4[i])) {
      squares4[i].caught();
      power++;}  } 
}
   }
  
  
  
  
  // if stage 3 was selected it brings you here
 if (stage==3){
    image(img6,0,0);// this displays all the text for the rules and controls of the game
    textAlign(CENTER,BOTTOM);
    textSize(42);
    text("RULES",140,80);
    text("_______",140,95);
    textSize(20);
    text("Green alien = energy level+1", w+200,h-50);
    text("if you get six, it will slow down the aliens",w+255,h-20);
    text("Red alien = score+1", w+200,h+50);
    text("Blue alien =life+1",w+200,h+150);
    text("Black alien =life-1",w+200,h+250);
    text("Use the arrow keys to move",w+260,h+350);
    text("and type 's' to shoot ",w+260,h+380);
        
    image(img9,w,h-80,50,50);
    image(img3,w,h,50,50);
    image(img4,w,h+100,50,50);
    image(img5,w,h+200,50,50);
    image(img8,w-25,h+280,100,100);
    image(img10,bx3,by3,boxSize,boxSize);
    image(img16,w-80,h+320,50,50);
    
 // if this button is pressed it will bring you back to the main screen
    if (mousePressed== mouseX > bx3-boxSize && mouseX < bx3+boxSize && 
      mouseY > by3-boxSize && mouseY < by3+boxSize)
   {  stage=1; }
 }
 
 
 
 //if you get this score it will display the winning mode
 if (score==40)
 {
     minim.stop();// this ends the other song 
    au_player4.play(100) ;// this starts another song
   image(img13,0,0);
   textSize(65);
   fill(235,0,0);
   text("Congratulations!",300,100);
   textSize(42);
   text("You Saved The Universe",300,200);
   textSize(28);
      text("final Power",120,520);//this displays the final score in the game
    text(power, 120,560);
    text("final score",300,520);//this displays the final score in the game
    text(score, 300,560);
    text("final Lives",490,520);//this displays the amount of final lives in the game
    text(lives, 480,560);
   image(img2,260,300,80,80);
   noLoop();
 }
 
 // this will bring you to the game over screen when you have 0 lives
if (lives==0)
{
    tint(25,255,150);// this alters the use of use in the backgrounds
    image(img11,0,0);
    textSize(40);
    fill(255);
    image(img15, 220,-30,img15.height/1.9,img15.width/1.8);
    text("Click To Restart", 290,330);
    text("final Score",290,380);
    text(score, 290,440);
    if(score<=20){
      text("Better luck ", 300,500);//this displays a different message depending on what score you get
       text("Next Time", 300,560);
    }
     if(score>20){
      text("You Have ",300,500);
     text("The Power!", 300,560);
    }
    noLoop();             //Stop looping at the end of the draw function
    lost=true;
    textSize(13);
    gameover++;
}

}


//this is used to make sure the mouse can't drag and the mouse can go outside the required area it in
void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
    bx2 = mouseX-xOffset; 
    by2 = mouseY-yOffset;
  }
}


void mousePressed()                              //Runs whenever the mouse is pressed
{
 if(overBox) { 
    locked = true;                                //this makes sure it is locked
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 
xOffset = mouseX-bx2; 
  yOffset = mouseY-by2; 


if (lost==true)                                //If we lost the game, reset now and start over 
  {
     au_player1.play(10) ;             //this plays a new song
      //Reset all variables to initial conditions
    textSize(28);
    lives=3;
    score=0;
    power=0;
     catcher.setLocation(280,500);
     catcher2.setLocation(340,500);
    lost=false;
    loop();     
    //Begin looping draw function again
  }



}


void keyPressed()
{
  if(key=='r')//this is where you reset the game when you press 'r'
  {
     minim.stop() ;
    setup();
  //  draw();

     totalSquares = 0; 
   
     fill(255);

     score=0;
     power=0;
    loop();
  }
   if(key=='p')//this will pause the game when you press 'p'
  {
       au_player3.play(10) ; 
    noLoop();
       image(img6,0,0);
   
    text("Game is Paused",450,60);
    text("Press 'l' key to resume the game",450,80);
    fill(255);
    text("(1)Colliding with the grey asteroid loses a life", 380, 120);   
    text("(2).Colliding with the red asteroid gives a point", 380,175);
    text("(3).Colliding with the blue asteroid gains a life",380,230);
    text("(4).Colliding with the green asteroid gives ",380,285);
    text("you energy to create black holes",330,315);
    text("(5).Colliding with a mini star gives you fuel",340,370);
    text("(6)If you run out of fuel, your controls are in reverse",350,425);
    text("You need to go to the sun to get more fuel",380,455);
    text("(7)You control the spaceship using w,a,s,d",380,510);
    text("and shoot using the space key",450,540);
    fill(255,0,0);
    textSize(30);
    text("Press 'r' to restart",450,580);
       



    
    
    
    
    
  }
    if(key=='l')//this will resume the game when 'l'is pressed
    {
      loop();
    }


}
