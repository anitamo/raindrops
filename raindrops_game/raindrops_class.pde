class Rain {
  PVector loc, vel, acc;
  PImage raindrop;
  float d;
  Rain() {
    raindrop = loadImage("rain-drop.png");
    loc = new PVector(random(width), -d);
    vel = new PVector(0, 2);
    d=10;
  }
  void display() {
    image(raindrop, loc.x, loc.y, d, d);
  }
  void fall() {
    loc.add(vel);
  }
  void caught() {
    loc.set(random(width), 0);
    vel.set(0, random(0, 2));
  }
  void leave() {
    loc.set(height*2, 0);
    vel.set(0, 0);
  }
  void die() {
    if (loc.x >= height) {
      die--;
      leave();
    }
  }
}

