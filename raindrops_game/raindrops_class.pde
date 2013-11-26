class Rain{
  PVector loc;
  PVector vel;
  
  Rain(){
    loc = new PVector(random(width),random(height));
    vel = new PVector(0,2);
  }
  void display(){
    fill(255,255,255);
    ellipse(loc.x,loc.y,10,10);
  }
  void fall(){
    loc.add(vel);
  }
  void restart(){
    if(loc.y>height){
      loc.y=0;
      vel.y=2;
    }
  }
}
