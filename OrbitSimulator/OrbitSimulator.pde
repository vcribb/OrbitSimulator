import java.util.*;
import java.lang.*;
import controlP5.*;

ControlP5 cp5;
SYSTEM s = new SYSTEM();
String m, _x, _y;
float xPos, yPos;

void setup(){
  size(1000, 600);
  smooth();
  background(0);
  
  // input fields for mass, x vel, y vel, also a submit button
  cp5 = new ControlP5(this);
  cp5.addTextfield("mass").setPosition(800, 30).setSize(140, 35).setAutoClear(false);
  cp5.addTextfield("x vel").setPosition(800, 100).setSize(140, 35).setAutoClear(false);
  cp5.addTextfield("y vel").setPosition(800, 170).setSize(140, 35).setAutoClear(false);
  cp5.addBang("Submit").setPosition(800, 280).setSize(80, 35);
  
  s.addBody(new Body(20000, 350, 300, 0, 0.85));
  //s.addBody(new Body(50000, 250, 300, 0, -0.85));
}

void draw(){
  background(0);
  /*
  if(s.size() == 0){
    text("Click to place central planet!", 150, 100);
  }
  else{
    if(s.size() == 1){
      fill(255, 255, 255);
      text("Click to add orbiting bodies!", 150, 100);
    }
    fill(204, 45, 0);
    ellipse(s.getBody(0).getX(), s.getBody(0).getY(), 100, 100);
  }
  */
 //textSize(15);
  text("Click to choose location, \nthen click SUBMIT!", 800, 240);
  s.show();
  s.run();
}

void Submit() {
  m = cp5.get(Textfield.class,"mass").getText();
  _x = cp5.get(Textfield.class,"x vel").getText();
  _y = cp5.get(Textfield.class,"y vel").getText();
  
  // then make new Body(m, someX, someY, _x, _y);
  // then clear m, _x, _y again
 Body b = new Body(Double.parseDouble(m), xPos, yPos, Float.parseFloat(_x), Float.parseFloat(_y));
 s.addBody(b);
 m = "";
 _x = "";
 _y = "";
}

void mousePressed(){
 
  xPos = mouseX;
  yPos = mouseY;
  
}

public class SYSTEM{

  private ArrayList<Body> bodies;

  public SYSTEM(){
    bodies = new ArrayList<Body>();
  }

  public int size(){
    return bodies.size();
  }
  
  //basic getter
  public Body getBody(int index){
    return bodies.get(index);
  }

  //basic setter
  public void addBody(Body thing){
    bodies.add(thing);
  }

  //main function! this calls the orbit function on each pair of bodies in the SYSTEM.
  public void run(){
    for (int x = 0; x < bodies.size(); x++){
      for (int y = 0; y < bodies.size(); y++){
        if (x != y){
          getBody(x).orbit(getBody(y));
        }
      }
    }
  }
  
  //calls the display function on each body in the SYSTEM to "draw" it
  void show(){
    for (int x = 0; x < bodies.size(); x++){
      getBody(x).display();
    }
  }
    
}

public class Body{

    private double mass;
    private float xvelocity;
    private float yvelocity;
    private float x;
    private float y;

    public Body(double m, float xpos, float ypos, float xvel, float yvel){
  mass = m;
  x = xpos;
  y = ypos;
  xvelocity = xvel;
  yvelocity = yvel;
    }

    //a bunch of getters

    public float getXVel(){
  return xvelocity;
    }
    public float getYVel(){
  return yvelocity;
    }
    public float getX(){
  return x;
    }
    public float getY(){
  return y;
    }
    public double getMass(){
  return mass;
    }

    //a bunch of setters

    public void setXVel(float newXVel){
  xvelocity = newXVel;
    }
    public void setYVel(float newYVel){
  yvelocity = newYVel;
    }
    public void setX(float newX){
  x = newX;
    }
    public void setY(float newY){
  y = newY;
    }
    public void setMass(double newMass){
  mass = newMass;
    }

    //main function!
    public void orbit(Body other){
      force(other);
      move();
    }
   
    //private helpers
  private double dist(Body other){
    return Math.sqrt(Math.pow(getX() - other.getX(), 2) +
       Math.pow(getY() - other.getY(), 2));
  }

  //finds the magnitude of acceleration due to the force exerted by a body
  private double forceAcc(Body other){
    //scale factor of 100 comes in here
    return (6.67 * Math.pow(10, -24)) * other.getMass() /
      (Math.pow(dist(other), 2));
  }

  //finds the angle between the two bodies
  private double theta(Body other){
    return Math.atan(Math.abs(getX() - other.getX())/
       Math.abs(getY() - other.getY()));
  }

  private void force(Body other){
    //accounting for time errors
    //calculates the values of the gravitational force many times per frame and adds them
    float counter = 0.0;
    float simtime = 0.001;
    counter += (1 / frameRate);
    while (counter > 0.0){
      if (getX() > other.getX()){
        xvelocity -= forceAcc(other) * Math.sin(theta(other)) * simtime;
      }
      else{
        xvelocity += forceAcc(other) * Math.sin(theta(other)) * simtime;
      }
      if (getY() > other.getY()){
        yvelocity -= forceAcc(other) * Math.cos(theta(other)) * simtime;
      }
      else{
        yvelocity += forceAcc(other) * Math.cos(theta(other)) * simtime;
      }
      counter -= simtime;
    }
  }

  //applies the effects of the gravitational force
  void move(){
    setX(getX() + xvelocity);
    setY(getY() + yvelocity);
  }
  
  //draws the individual bodies
  void display() {
    stroke(204, 102, 0);
    fill(204, 102, 0);
    ellipse(getX(), getY(), 50, 50);
  }
    
}
