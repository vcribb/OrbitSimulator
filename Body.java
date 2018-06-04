import java.util.*;

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

    //helpers - make private later
    public double dist(Body other){
	return Math.sqrt(Math.pow(getX() - other.getX(), 2) +
			 Math.pow(getY() - other.getY(), 2));
    }

    public static void main(String[] args){
	Body b = new Body(10, 0, 0, 0, 0);
	Body c = new Body(10, 3, 4, 0, 0);
	System.out.println(b.dist(c));
    }

}
