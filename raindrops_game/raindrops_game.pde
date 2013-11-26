Rain[]drops= new Rain[3];
Catcher c1;
void setup(){
  size(500,500);
  c1 = new Catcher();
  for(int i=0; i<drops.length;i++){
    drops[i]=new Rain();
}
}
void draw(){
 background(0);
 c1.display();
 c1.update();
 for(int i=0; i<drops.length;i++){
   drops[i].display();
   drops[i].fall();
   drops[i].restart();
}
}
