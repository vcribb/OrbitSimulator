import java.util.*;
import java.lang.*;
import controlP5.*;

ControlP5 cp5;
System a;
String m, _x, _y;
float xPos, yPos;

void setup(){
  size(1000, 600);
  a = new System();
  
  // input fields
  cp5 = new ControlP5(this);
  cp5.addTextfield("mass").setPosition(800, 30).setSize(140, 35).setAutoClear(false);
  cp5.addTextfield("x vel").setPosition(800, 100).setSize(140, 35).setAutoClear(false);
  cp5.addTextfield("y vel").setPosition(800, 170).setSize(140, 35).setAutoClear(false);
  cp5.addBang("Submit").setPosition(800, 240).setSize(80, 35);
}

void draw(){
  background(50);
  if(a.size() == 0){
    text("Click to place central planet!", 150, 100);
  }
  else{
    if(a.size() == 1){
      fill(255, 255, 255);
      text("Click to add orbiting bodies!", 150, 100);
    }
    fill(204, 45, 0);
    ellipse(a.getBody(0).getX(), a.getBody(0).getY(), 100, 100);
  }
  for(int i = 1; i < a.size(); i++){
    a.getBody(i).display();
  }
}

void Submit() {
  m = cp5.get(Textfield.class,"mass").getText();
  _x = cp5.get(Textfield.class,"x vel").getText();
  _y = cp5.get(Textfield.class,"y vel").getText();
  println("mass: " + m);
  println("x vel: " + _x);
  println("y vel: " + _y);
  // then make new Body(m, someX, someY, _x, _y);
  // then clear m, _x, _y again
 // Body b = new Body(Integer.parseInt(m), xPos, yPos, Float.parseFloat(_x), Float.parseFloat(_y));
 // a.addBody(b);
}

void mousePressed(){
   if(a.size() == 0){
    Body center = new Body(1000, mouseX, mouseY, 0, 0);
    a.addBody(center);
  }
  else{
    // random values, set defaults later
    // also to do later: det when to use defaults, when to wait for input
    
    
    Body bod = new Body(40, mouseX, mouseY, 10, 10);
    a.addBody(bod);
    
//    println(a.size());
/*
  xPos = mouseX;
  yPos = mouseY;
  */
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
    private float xvelocity;
    private float yvelocity;
    private double xacc;
    private double yacc;
    private float x;
    private float y;

    public Body(int m, float xpos, float ypos, float xvel, float yvel){
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

    public void setXVel(float newXVel){
  xvelocity = newXVel;
    }
    public void setYVel(float newYVel){
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
    
    // set sizes for now
  void display(){
    fill(0, 145, 104);
    ellipse(x, y, 20.0, 20.0);
  }
}
