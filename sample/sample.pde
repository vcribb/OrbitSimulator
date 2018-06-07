SYSTEM s = new SYSTEM();

void setup() {
  size(600, 600);
  smooth();
  background(0);
  s.addBody(new Body(1000000000, 300, 300, 0, 0));
  s.addBody(new Body(1000, 200, 300, 0, -10));
}

void draw() {
  background(0);
  text(frameRate, 20, 20);
  s.run();
}

import java.util.*;

public class Body{

  private float mass;
  private float xvelocity;
  private float yvelocity;
  private float x;
  private float y;

  public Body(float m, float xpos, float ypos, float xvel, float yvel){
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
  public float getMass(){
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
  public void setMass(float newMass){
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
    float counter = 0.0;
    float simtime = 0.001;
    counter += (1 / frameRate);
    while (counter > 0.0){
      if (getX() > other.getX()){
        xvelocity -= forceAcc(other) * Math.sin(theta(other));
      }
      else{
        xvelocity += forceAcc(other) * Math.sin(theta(other));
      }
      if (getY() > other.getY()){
        yvelocity -= forceAcc(other) * Math.cos(theta(other));
      }
      else{
        yvelocity += forceAcc(other) * Math.cos(theta(other));
      }
      counter -= simtime;
    }
  }

  private void move(){
    setX(getX() + xvelocity * (1 / frameRate));
    setY(getY() + yvelocity * (1 / frameRate));
  }
  
  void display() {
    ellipse(getX(), getY(), 50, 50);
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
    return bodies.get(index);
  }

  //basic setter
  public void addBody(Body thing){
    bodies.add(thing);
  }

  //main function! this calls the orbit function on each pair of bodies
  //in the SYSTEM.
  public void run(){
    for (int x = 0; x < bodies.size(); x++){
      getBody(x).display();
      for (int y = 0; y < bodies.size(); y++){
        getBody(x).orbit(getBody(y));
      }
    }
  }
    
}
