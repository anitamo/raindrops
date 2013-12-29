class Catcher {
  PVector loc, vel;
  PImage umbrella;
  int d;

  Catcher() {
    umbrella= loadImage("umbrella.png");
    loc = new PVector(mouseX, height-d);
    d=100;
  }

  void display() {
    imageMode(CENTER);
    image(umbrella, loc.x, loc.y, d, d);
  }

  void update() {
    loc.set(mouseX, height-d);
  }
  boolean catchDrop(Rain fall) {
    if (loc.dist(fall.loc) < d/2 + fall.d/2) {
      fall.caught();
      return true;
    }
    else {
      return false;
    }
  }
  void catcherleave() {
    if (end== true) {
      loc.set(height*2, 0);
    }
  }
}

