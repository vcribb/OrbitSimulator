Ball myBall;
final static ArrayList<Ball> balls = new ArrayList();

void setup() {
  size(600, 600);
  smooth();
  mousePressed();
}

void draw() {
  background(0);
  for (Ball b : balls){
    b.run();
  }
}

void mousePressed(){
  balls.add(new Ball(mouseX, mouseY));
}

class Ball {
  float x, y;
  Ball(float _x, float _y) {
    x=_x;
    y=_y;
  }
  void run() {
    display ();
  }
  void display() {
    ellipse(x, y, random(100), random(100));
  }
}
