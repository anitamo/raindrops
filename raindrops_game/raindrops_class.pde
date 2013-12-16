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
  //displays the raindrop
  void display() {
    image(raindrop, loc.x, loc.y, d, d);
  }
  //makes the raindrop fall at the specified velocity
  void fall() {
    loc.add(vel);
  }
  //resets the raindrop
  void caught() {
    loc.set(height*2, 0);
    vel.set(0, 0);
  }
}

