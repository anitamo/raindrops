Rain[]drops= new Rain[300];
Catcher c1;
int index = 0;
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
 for(int i=0; i<=index;i++){
   drops[i].display();
   drops[i].fall();
   drops[i].restart();
}
}
void mousePressed(){
  if(index<drops.length-1){
    index++;
  }
}
