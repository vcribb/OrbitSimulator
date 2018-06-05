import java.util.*;
import java.lang.*;

System a;
boolean center; 
int cX, cY;

void setup(){
  size(500, 500);
  a = new System();
  center = false;
}

void draw(){
  background(50);
  if(!center){
    text("Click to place central planet!", 100, 100);
  }
  if(center){
    if(a.size() == 0){
      text("Click to add orbiting bodies!", 100, 100);
    }
    fill(204, 44, 0);
    ellipse(cX, cY, 100, 100);
  }
  for(int i = 0; i < a.size(); i++){
    a.getBody(i).display();
  }
}

void mousePressed(){
   if(!center){
    cX = mouseX;
    cY = mouseY;
    center = true;
  }
  else{
    // random values, set defaults later
    Body bod = new Body(40, mouseX, mouseY, 10, 10);
    a.addBody(bod);
    println(a.size());
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
    
    public int size(){
      return bodies.size();
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
    private float x;
    private float y;

    public Body(int m, float xpos, float ypos, double xvel, double yvel){
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
    public float getX(){
  return x;
    }
    public float getY(){
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
    public void setX(float newX){
  x = newX;
    }
    public void setY(float newY){
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
    
    // just testing
  void display(){
    fill(0, 145, 104);
    ellipse(x, y, 20.0, 20.0);
  }
}
