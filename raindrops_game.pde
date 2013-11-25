Rain[]drops= new Snow[1800];
Catcher catch;
void setup(){
  size(500,500);
  for(int i=0; i<flakes.length;i++){
    flakes[i]=new Snow();
}
}
void draw(){
 background(0,50,100);
 for(int i=0; i<flakes.length;i++){
   flakes[i].display();
   flakes[i].fall();
   flakes[i].restart();
}
}
