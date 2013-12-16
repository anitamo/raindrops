Rain[]drops= new Rain[10];
Catcher c1;
int oldtime =0;
int index = 1;
int score;
int threshold = 2000;
PImage background;

void setup() {
  background = loadImage("playground.png");
  size(background.width, background.height);
  c1 = new Catcher();
  for (int i=0; i< drops.length;i++) {
    drops[i]=new Rain();
  }
  c1 = new Catcher();
}
void draw() {
  background(background);
  textSize(50);
  fill(0);
  text(score, 300, 100);

  if (millis() > threshold) {
    if (index < drops.length) {
      index++;
      oldtime = millis();
    }
    c1.display();
    c1.update();
  }
  for (int i=0; i<index;i++) {
    drops[i].display();
    drops[i].fall();
    if (c1.catchDrop(drops[i])==true) {
      drops[i].caught();
      score++;
      threshold-=10;
    }
  }
}

