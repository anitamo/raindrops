class Catcher {
  PVector loc;
  int x,y;

  Catcher() {
    loc = new PVector(mouseX, height-y);
    x = 70;
    y= 20;
  }

  void display() {
    fill(224,20,20);
    rect(loc.x, loc.y, x, y);
  }

  void update() {
    loc.set(mouseX, height-40);
  }
}
   
