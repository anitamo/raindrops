Rain[]drops= new Rain[1000];
Catcher c1;
int x,y, w, h;
int rx,ry, rw, rh;
int oldtime =0;
int index = 1;
int score;
int threshold = 2000;
PImage background;
boolean start = false;

void setup() {
  y=0;
  w=50;
  h=height;
  colorMode(HSB,width,100,100);
  //sets the background as a playground image
  background = loadImage("playground.png");
  size(background.width, background.height);
  c1 = new Catcher();    
  //controls when the rain class works
  for (int i=0; i< drops.length;i++) {
    drops[i]=new Rain();
  }
  c1 = new Catcher();
  ry= height/2;
  rx= width/2;
  rw=50;
  rh=50;
}
void draw() {
  if (start == false) {
     x=0;
  for (int x=0; x<=width; x+=w) {
    fill(dist(mouseX,0,x,0),100,100);
    rect(x, y, w, h);
  }
    fill(87, 252, 118);
    rect(width/2, height/2, 50, 50);
  }
  if(start == true){
    background(background);
    textSize(60);
    fill(0);
    //displays the number of raindrops caught
    text(score, 300, 100);
    //displays and runs the catcher
    c1.display();
    c1.update();
    //the raindrops run on a timer
    if (millis()-oldtime > threshold) {
      if (index < drops.length) {
        index++;
        oldtime = millis();
      }
    }
    //for every raindrop caught, the score increases
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
  }
  void mousePressed(){
    if(mouseX>rx && mouseX<rx+rw && mouseY>ry && mouseY<ry+rh){
      start=true;
    }
  }
