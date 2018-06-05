import java.util.*;
import java.lang.*;

System a;
boolean center;
int count, cX, cY;

void setup(){
  size(500, 500);
  center = false;
}

void draw(){
  background(50); 
  if(center){
    fill(204, 44, 0);
    ellipse(cX, cY, 100, 100);
  }
}

void mousePressed(){
   if(!center){
    fill(204, 44, 0);
    cX = mouseX;
    cY = mouseY;
    ellipse(cX, cY, 100, 100);
    center = true;
  }
}

public class System{

    private ArrayList<Body> bodies;

    public System(){
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

    //main function!
    public void run(){
  //write this later
  for (int x = 0; x < bodies.size(); x++){
      for (int y = 0; y < bodies.size(); y++){
    getBody(x).orbit(getBody(y));
      }
  }
    }
    
}

public class Body{

    private int mass;
    private double xvelocity;
    private double yvelocity;
    private double xacc;
    private double yacc;
    private double x;
    private double y;

    public Body(int m, double xpos, double ypos, double xvel, double yvel){
  mass = m;
  x = xpos;
  y = ypos;
  xvelocity = xvel;
  yvelocity = yvel;
    }

    //a bunch of getters

    public double getXVel(){
  return xvelocity;
    }
    public double getYVel(){
  return yvelocity;
    }
    public double getXAcc(){
  return xacc;
    }
    public double getYAcc(){
  return yacc;
    }
    public double getX(){
  return x;
    }
    public double getY(){
  return y;
    }
    public int getMass(){
  return mass;
    }

    //a bunch of setters

    public void setXVel(double newXVel){
  xvelocity = newXVel;
    }
    public void setYVel(double newYVel){
  yvelocity = newYVel;
    }
    public void setXAcc(double newXAcc){
  xacc = newXAcc;
    }
    public void setYAcc(double newYAcc){
  yacc = newYAcc;
    }
    public void setX(double newX){
  x = newX;
    }
    public void setY(double newY){
  y = newY;
    }
    public void setMass(int newMass){
  mass = newMass;
    }

    //main function!
    public void orbit(Body other){
  //write this later
  y += yvelocity;
  x += xvelocity;
  xvelocity += xacc;
  yvelocity += yacc;
    }

}
