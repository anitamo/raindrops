Rain[]drops= new Rain[55];
Catcher c1;
int oldtime =0;
int index = 1;
int score;
int threshold = 2000;
PImage background;

void setup() {
  background = loadImage("playground.jpg");
  size(background.width, background.height);
  c1 = new Catcher();
  for (int i=0; i<drops.length;i++) {
    drops[i]=new Rain();
  }
  c1 = new catcher();
}
void draw() {
  background(background);
  textsize(50);
  fill(0);
  text(score, 10, 100);

  if (millis() = oldtime>threshold) {
    if (index < drops.length) {
      index++;
      oldtime = millis();
    }
    c1.display();
    c1.update();
  }
  for (int i=0; i<=index;i++) {
    drops[i].display();
    drops[i].fall();
    if (c1.catchDrop(drops[i])==true) {
      drops[i].caught();
      score++;
      threshold-=10;
    }
  }

