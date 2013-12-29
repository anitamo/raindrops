Rain[]drops= new Rain[100];
Catcher c1;
int oldtime =0;
int currenttime;
int index = 0;
int score;
int threshold = 2000;
int die;
int lives = 3;
boolean start;
boolean end;
PImage background;

void setup() {
  background = loadImage("playground.png");
  size(background.width, background.height);
  c1 = new Catcher();
  for (int i=0; i< drops.length;i++) {
    drops[i]=new Rain();
  }
  c1 = new Catcher();
  start=false;
  end = false;
}
void draw() {
  if (start == false && end == false) {
    background(0);
    fill(131, 229, 100);
    rectMode(CENTER);
    rect(250, 400, 300, 150);
    textSize(40);
    textAlign(CENTER);
    fill(250, 250, 250);
    text("START", 250, 450);
  }

  if (start== true && end == false) {
    background(background);
    textSize(50);
    fill(255);
    text(score, 10, 100);
    textAlign(CORNER);
    text("Lives:" + lives, 0, height-30); //displays current lives on screen

    currenttime = millis();
    if (millis()-oldtime > threshold) {
      oldtime = currenttime;
        index++;
    }
    for (int i=0; i<index;i++) {
      drops[i].display();
      drops[i].fall();
      drops[i].die(); 
      c1.display();
      c1.update();
      //c1.catchDrop(drops[i]);

      if (drops[i].loc.y >= height) {
        lives-=1;
        drops[i].loc.set(width*10, -height);
        drops[i].vel.set(0, 0);
      }
     if (c1.catchDrop(drops[i])==true) {
       drops[i].caught();
        score+=1;
         //When the score increases, the time between falling raindrops will be decreased and they will start to fall faster
        threshold-=15;
     }
    }
    if (lives <=0) {
      end = true;
    }
    if (end == true) {
      c1.catcherleave();
      background(0);
      fill(255, 0, 0);
      textAlign(CENTER);
      textSize(80);
      text("GAME OVER", width/2, height/2);
    }
  }
}
void mousePressed() {
  if (mouseX>100  && mouseX< 400 && mouseY>325 && mouseY<475) {
    start=!start;
  }
}

