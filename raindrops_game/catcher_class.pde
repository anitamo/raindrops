class Catcher {
  PVector loc, vel;
  PImage umbrella;
  int d;

  Catcher() {
    umbrella= loadImage("umbrella.png");
    loc = new PVector(mouseX, height-d);
    d=100;
  }

 //sets the location of the umbrella to follow the mouse
  void display() {
    imageMode(CENTER);
    image(umbrella, loc.x, loc.y, d,d);
  }

  void update() {
    loc.set(mouseX, height-d);
  }
  
//if a raindrop touches the umbrella, it disappears  
boolean catchDrop(Rain fall){
  if(loc.dist(fall.loc) < d/2 + fall.d/2){
    fall.caught();
    return true;
  }
  else{
    return false;
  }
}
}

   
