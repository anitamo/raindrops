class Rain {
  PVector loc, vel, acc;
  PImage raindrop;
  float d;
  Rain() {
    raindrop = loadImage("rain-drop.png");//loads picture for raindrops
    loc = new PVector(random(width), -d);
    vel = new PVector(0, 2);
    d=10;
  }
  void display() {
    image(raindrop, loc.x, loc.y, d, d);
  }
  void fall() {//makes raindrops fall at a constant velocity
    loc.add(vel);
  }
  void caught() {//when a raindrop is caught it goes back up to the top of the screen
    loc.set(random(width), 0);
    vel.set(0, random(0, 2));
  }
  void leave() {//makes raindrops disappear for good
    loc.set(height*2, 0);
    vel.set(0, 0);
  }
}

