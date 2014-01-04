Rain[]drops= new Rain[100];
Catcher c1;
int oldtime =0;
int currenttime;
int index = 0; 
int score;
int threshold = 2000;
int lives = 3;
boolean start;//booleans control whether the game is running or not
boolean end;
PImage background;

void setup() {
  background = loadImage("playground.png");
  size(background.width, background.height);
  c1 = new Catcher();
  for (int i=0; i< drops.length;i++) { //creates an array of raindrops
    drops[i]=new Rain();
  }
  c1 = new Catcher();//creates the catcher
  start=false;
  end = false;
}
void draw() {
  if (start == false && end == false) {//start screen
    background(0);
    fill(149, 199, 216);
    textSize(60);
    text("~Rain Rain Go Away~", width/2, height/2); //name of game
    fill(131, 229, 100);
    rectMode(CENTER); //start button
    rect(250, 400, 300, 150);
    textSize(40);
    textAlign(CENTER);
    fill(250, 250, 250);
    text("START", 250, 450);
  }

  if (start== true && end == false) {//runs game
    background(background);
    textSize(50);
    fill(255);
    text(score, 10, 100);
    textAlign(CORNER);
    text("Lives:", 0, height-30); //displays the word "lives:" on screen

    currenttime = millis(); //raindrops fall based on timer
    if (millis()-oldtime > threshold) {
      oldtime = currenttime;
      index++;
    }
    for (int i=0; i<index;i++) {
      drops[i].display();//displays raindrops
      drops[i].fall();//raindrops fall
      c1.display();//displays catchers
      c1.update();//catcher follows the mouse
      //when you reach a certain score, you pass a level
      if (score == 10) { //sets level 1
        textAlign(CENTER);
        textSize(40);
        fill(252, 33, 33);
        text("You passed Level 1", width/2, height/2);
      }
      if (score == 30) {//sets level 2
        textAlign(CENTER);
        textSize(40);
        fill(252, 33, 33);
        text("You passed Level 2", width/2, height/2);
      }
      if (score == 60) {//game is won when the score is equal to 60
        background(0);
        fill(random(255), random(255), random(255));
        textSize(80);
        textAlign(CENTER);
        text("WINNER", width/2, height/2);
        drops[i].leave(); //raindrops go away
        lives= 4;//gets rid of the life circles
      }

      if (drops[i].loc.y >= height) { //when a raindrop touches the bottom of the screen, you lose a life
        lives-=1;
        drops[i].loc.set(width*10, -height);
        drops[i].vel.set(0, 0);
      }
      if (c1.catchDrop(drops[i])==true) {//when the catcher catches a raindrop, your score increases by one point
        drops[i].caught();
        score+=1;
        //when the score increases, the time between falling raindrops will be decreased and raindrops will start to fall faster
        threshold-=15; //each level gets harder
      }
    }
    if (lives == 4){//when the score reaches 60, the life balls disappear 
    }
    if (lives == 3) {//player starts out with 3 lives and three life balls on the screen
      noStroke();
      fill(255, 0, 0);
      ellipseMode(CENTER);
      ellipse(150, 460, 30, 30);
      ellipse(190, 460, 30, 30);
      ellipse(230, 460, 30, 30);
    }
    if (lives == 2) {//when player loses a life, one of the life balls disappears
      noStroke();
      fill(255, 0, 0);
      ellipseMode(CENTER);
      ellipse(150, 460, 30, 30);
      ellipse(190, 460, 30, 30);
    }
    if (lives == 1) {//when a player is down to one life, only one life ball is left on the screen
      noStroke();
      fill(255, 0, 0);
      ellipseMode(CENTER);
      ellipse(150, 460, 30, 30);
    }
    if (lives <=0) {//when the player runs out of lives, the game is over
      end = true;
    }
    if (end == true) {//gameover screen
      background(0);
      fill(255, 0, 0);
      textAlign(CENTER);
      textSize(80);
      text("GAME OVER", width/2, height/2);
    }
  }
}
void mousePressed() {//when you press the green button, the game starts to run
  if (mouseX>100  && mouseX< 400 && mouseY>325 && mouseY<475) {
    start=!start;
  }
}

