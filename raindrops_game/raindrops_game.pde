Rain[]drops= new Rain[10];
Catcher c1;
int oldtime =0;
int index = 0;
int score;
int threshold = 2000;
int die;
boolean start;
boolean end= false;
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
  die = 3;
}
void draw() {
  background(0);
  fill(131, 229, 100);
  rectMode(CENTER);
  rect(250, 400, 300, 150);
  textSize(40);
  textAlign(CENTER);
  fill(250, 250, 250);
  text("START", 250, 450);

  if (start) {
    background(background);
    textSize(50);
    fill(0);
    text(score, 300, 100);
    c1.display();
    c1.update();
    if (millis()-oldtime > threshold) {
      if (index < drops.length) {
        index++;
        oldtime = millis();
      }
    }
    for (int i=0; i<index;i++) {
      drops[i].display();
      drops[i].fall();
      drops[i].die();

      if (die == 0) {
        gameover = true;
      }
      if (c1.catchDrop(drops[i])==true) {
        drops[i].leave();
        score++;
        threshold-=10;
      }
      if (gameover == true) {
        raindrops[i].leave();
        catcher.catcherleave();
        background(0);
      }
    }
  }
}

void mousePressed() {
  if (mouseX>100  && mouseX< 400 && mouseY>325 && mouseY<475) {
    start=!start;
  }
}

