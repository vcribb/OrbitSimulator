import controlP5.*;

ControlP5 cp5;

//dimensions for buttons
float x = 25;
float y = 530;
float w = 150;
float h = 40;

//main SYSTEM
SYSTEM s = new SYSTEM();

//background image
PImage bg;

//useful for menus
boolean b = false;
boolean c = false;
boolean d = false;
boolean e = false;
boolean f = false;

boolean useful;

// textfield inputs
String m, _x, _y;

float mX;
float mY;

void setup(){
 size(600, 600);
 background(0);
 stroke(0);
 if ((int) (Math.random() * 2 + 1) % 2 == 0){
   bg = loadImage("nebula2.jpg");
 }
 else{
   bg = loadImage("nebula.jpg");
 }
 cp5 = new ControlP5(this);
}

void draw() {
  background(bg);
  if (!b && !c && !d && !e && !f){
    fill(255);
    rect(225, 300, w, h);
    rect(225, 400, w, h);
    fill(255);
    textSize(50);
    text("ORBIT SIMULATOR", 75, 230);
    textSize(15);
    fill(0);
    text("PRE-SET SYSTEMS", 235, 328);
    text("DRAW YOUR OWN", 235, 428);
  }
  if (mousePressed && !keyPressed){
    if (mouseX > 225 && mouseX < 225 + w && mouseY > 300 && mouseY < 300 + h){
      b = true;
      c = false;
      d = false;
      e = false;
      f = false;
    }
    if (mouseX > 225 && mouseX < 225 + w && mouseY > 400 && mouseY < 400 + h){
      c = true;
      b = false;
      d = false;
      e = false;
      f = false;
    }
  }
  if (b){
    fill(140, 226, 191);
    rect(x, y, w, h);
    rect(x + 200, y, w, h);
    fill(255);
    rect(x + 400, y, w, h);
    fill(0);
    text("PLANET AND SUN", x + 10, y + 30);
    text("BINARY SYSTEM", x + 220, y + 30);
    text("BACK TO MENU", x + 420, y + 30);  
    if (mousePressed && !keyPressed && !c && !d){
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
        s.addBody(new Body(9 * Math.pow(10, 26), 350, 300, 0, 0.825));
        s.addBody(new Body(9 * Math.pow(10, 26), 250, 300, 0, -0.825));
      }
      if(mouseX > x + 400 && mouseX < x + w + 400 && mouseY > y && mouseY < y + h){
        s.clear();
        b = false;
        c = false;
        d = false;
        e = false;
        f = false;
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
  if (c){
    s.clear();
    fill(255);
    rect(x, y, w, h);
    fill(140, 226, 191);
    rect(x + 200, y, w, h);
    fill(255);
    rect(x + 400, y, w, h);
    fill(0);
    textSize(15);
    text("DRAW BODIES", x + 25, y + 30);
    text("RUN THE SYSTEM!", x + 210, y + 30);
    text("BACK TO MENU", x + 420, y + 30);
    if (mousePressed && !keyPressed && !b && !d){
      if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
        d = true;
        b = false;
        c = false;
        e = false;
        f = true;
      }
      if(mouseX > x + 200 && mouseX < x + w + 200 && mouseY > y && mouseY < y + h){
        e = true;
        b = false;
        d = false;
        f = false;
      }
      if(mouseX > x + 400 && mouseX < x + w + 400 && mouseY > y && mouseY < y + h){
        s.clear();
        b = false;
        c = false;
        d = false;
        e = false;
        f = false;
      }
    }
  }
  if (d){
    b = false;
    c = false;
    fill(255);
    rect(x, y, w, h);
    fill(140, 226, 191);
    rect(x + 200, y, w, h);
    fill(255);
    rect(x + 400, y, w, h);
    fill(0);
    textSize(15);
    text("CLEAR SYSTEM", x + 20, y + 30);
    text("RUN THE SYSTEM!", x + 210, y + 30);
    text("BACK TO MENU", x + 420, y + 30);
    //user input stuff
    if(s.size() == 0){
      fill(255);
      textSize(20);
      text("shift + click to place bodies!", 175, 100);
    }
    if (mousePressed && !keyPressed && !b && !c){
      if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
        s.clear();
        e = false;
        f = true;
      }
      if(mouseX > x + 200 && mouseX < x + w + 200 && mouseY > y && mouseY < y + h){
        e = true;
        b = false;
        c = false;
        f = false;
      }
      if(mouseX > x + 400 && mouseX < x + w + 400 && mouseY > y && mouseY < y + h){
        s.clear();
        cp5.remove("mass");
        cp5.remove("x vel");
        cp5.remove("y vel");
        cp5.remove("Submit");
        b = false;
        c = false;
        d = false;
        e = false;
        f = false;
      }
    }
    //shift 16, ctrl 17
    if(mousePressed && keyPressed && keyCode == 16 && f){
      mX = mouseX;
      mY = mouseY;
      cp5.addTextfield("mass").setPosition(440, 30).setSize(140, 30);
      cp5.addTextfield("x vel").setPosition(440, 80).setSize(140, 30);
      cp5.addTextfield("y vel").setPosition(440, 130).setSize(140, 30);
      cp5.addBang("Submit").setPosition(440, 200).setSize(80, 30);
      /*if(s.size() == 0){
        Body center = new Body(Math.pow(10, 27), mX, mY, 0, 0);
        s.addBody(center);
      }
      else if (mouseX != s.getBody(0).getX() && mouseY != s.getBody(0).getY()){
        Body bod = new Body(Math.pow(10, 21), mouseX, mouseY, 1, 0);
        s.addBody(bod);
      }
      */
      s.show();
    }
    s.show();
  }
  if(d && e){
    s.run();
  }
}

void Submit() {
  if(cp5.get(Textfield.class,"y vel").getText().trim().length() > 0 && cp5.get(Textfield.class,"x vel").getText().trim().length() > 0 &&
  cp5.get(Textfield.class,"mass").getText().trim().length() > 0){
    m = cp5.get(Textfield.class,"mass").getText();
    _x = cp5.get(Textfield.class,"x vel").getText();
    _y = cp5.get(Textfield.class,"y vel").getText();
  
    // add new Body(m, someX, someY, _x, _y);
    // then clear m, _x, _y
    Body b = new Body(Double.parseDouble(m), mX, mY, Float.parseFloat(_x), Float.parseFloat(_y));
    s.addBody(b);
    m = "";
    _x = "";
    _y = "";
 
    // clear after submitting
    cp5.remove("mass");
    cp5.remove("x vel");
    cp5.remove("y vel");
    cp5.remove("Submit");
  }
  else{
    println("Enter all fields and select a location before submitting.");
  }
}

//JAVA CLASSES********************************************************************************************************************

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
    stroke(0);
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
    if (index >= bodies.size()){return null;}
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
          if (getBody(x).dist(getBody(y)) <= 40){
            b = false;
            c = false;
          }
          else{
            getBody(x).orbit(getBody(y));
          }
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
