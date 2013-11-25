Rain[]drops= new Rain[1800];
void setup(){
  size(500,500);
  for(int i=0; i<drops.length;i++){
    drops[i]=new Rain();
}
}
void draw(){
 background(0,50,100);
 for(int i=0; i<drops.length;i++){
   drops[i].display();
   drops[i].fall();
   drops[i].restart();
}
}
