float x = 25;
float y = 530;
float w = 150;
float h = 40;
SYSTEM s = new SYSTEM();

void setup(){
 size(600, 600);
 background(0);
 stroke(0);
}

void draw() {
  background(0);
  fill(255);
  rect(x, y, w, h);
  rect(x + 200, y, w, h);
  fill(126, 188, 124);
  rect(x + 400, y, w, h);
  fill(0);
  text("PLANET AND SUN", x + 10, y + 30);
  text("BINARY SYSTEM", x + 220, y + 30);
  text("DRAW YOUR OWN", x + 410, y + 30);
  if (mousePressed){
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
      s.clear();
      //adds a sun at the center of the world
      s.addBody(new Body(Math.pow(10, 27), 300, 300, 0, 0));
      //adds an orbiting planet of smaller mass
      s.addBody(new Body(Math.pow(10, 21), 175, 300, 0, -1));
    }
    if(mouseX > x + 200 && mouseX < x + w + 200 && mouseY > y && mouseY < y + h){
      s.clear(); 
      //creates two stars of equal mass
      s.addBody(new Body(Math.pow(10, 27), 350, 300, 0, 0.75));
      s.addBody(new Body(Math.pow(10, 27), 250, 300, 0, -0.75));
    }
    if(mouseX > x + 400 && mouseX < x + w + 400 && mouseY > y && mouseY < y + h){
      s.clear();
    }
  }
  textSize(15);
  //monitors for the velocity of each body in the SYSTEM
  if (s.size() > 0){
    fill(255);
    text("x velocity of body 1: " + s.getBody(0).getXVel() * 100, 20, 20);
    text("y velocity of body 1: " + s.getBody(0).getYVel() * 100, 20, 40);
    text("x velocity of body 2: " + s.getBody(1).getXVel() * 100, 20, 60);
    text("x velocity of body 2: " + s.getBody(1).getYVel() * 100, 20, 80);
  }
  s.show();
  s.run();
}

void mousePressed(){
  if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
    s.clear();
    //adds a sun at the center of the world
    s.addBody(new Body(Math.pow(10, 27), 300, 300, 0, 0));
    //adds an orbiting planet of smaller mass
    s.addBody(new Body(Math.pow(10, 21), 175, 300, 0, -1));
  }
  if(mouseX > x + 250 && mouseX < x + w + 250 && mouseY > y && mouseY < y + h){
    s.clear(); 
    //creates two stars of equal mass
    s.addBody(new Body(Math.pow(10, 27), 350, 300, 0, 0.75));
    s.addBody(new Body(Math.pow(10, 27), 250, 300, 0, -0.75));
  }
}

import java.util.*;

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
    ellipse(getX(), getY(), 40, 40);
  }

}

import java.util.*;
import java.lang.*;

public class SYSTEM{

  private ArrayList<Body> bodies;

  public SYSTEM(){
    bodies = new ArrayList<Body>();
  }

  //basic getter
  public Body getBody(int index){
    if (bodies.size() == 0){return null;}
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
  
  void clear(){
    bodies = new ArrayList<Body>();
  }
  
  int size(){
    return bodies.size();
  }
    
}
