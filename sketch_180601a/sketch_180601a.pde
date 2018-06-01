ArrayList<Mover> movers;
public void setup() {
  size(600, 300);
  movers = new ArrayList<Mover>();
  mousePressed();
}
public void draw() {
  background(255);
  fill(0);
  text(frameRate, 20, 20);
  //if (mousePressed) {
    //movers.add(new Mover(1));
  //}
  mousePressed();
  for (Mover m : movers) {
    m.display();
    m.update(movers);
  }
}

public class Mover {
  float x, xspeed, xacc;
  float y, yspeed, yacc;
  float r;
  color c;

  public Mover() {
    x = width/2;
    y = height/2;
    r = 50;
    c = color(0, 255, 0);
    xspeed= -2.5;
    yspeed= -1.5;
  }

  public Mover(int a) {
    x = mouseX;
    y = mouseY;
    r = 20+random(20);
    c = color(0, 255, 0);
    xspeed= random(1)-.5;
    yspeed= -3.5;
    yacc = 0.5;
  }

  public void update(ArrayList<Mover> others) {
    //change the position etc.
    x += xspeed; 
    y += yspeed; 
    yspeed += yacc;
    xspeed += xacc;
    //check the rest of the world for interactions
    checkWalls();
    checkOthers(others);
  }
  
  public void checkOthers(ArrayList<Mover> others){
    c = color(0,255, 0);
    for(Mover other : others){
      if(this != other){
       //check for collide
       if(dist(x,y,other.x,other.y) < r + other.r ){
          c = color(255, 0, 0); 
       }
      }
    }
  }
  public void checkWalls() {
    if (x < r) {
      println("OW!");
      xspeed *= -1;
      x = r;//prevents 2 true in a row
    }
    if (x > width - r) {
      println("OW!");
      xspeed *= -1;
      x = width - r;//prevents 2 true in a row
    }
    if (y < r) {
      println("OW!");
      yspeed *= -.9;
      y = r;//prevents 2 true in a row
    }
    if (y > height - r) {
      println("OW!");
      yspeed *= -.9;
      y = height - r;//prevents 2 true in a row
    }
  }
  public void display() {
    fill(c);
    ellipse(x, y, r * 2, r * 2);
  }
  void mousePressed(){
    Mover m = new Mover(1);
    movers.add(m);
  }
}
