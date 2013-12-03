color c = color(0);
int oldtime = 0;
int currenttime = 0;
int timechange = 0;
//int time= 2000;
void setup() {
  size(500, 500);
}
void draw() {
  background(c);
  currenttime= millis();
  timechange = currenttime - oldtime;
  if (timechange>=2000) {
    c= color(random(255), random(255), random(255));
    oldtime = currenttime;
  }
}

