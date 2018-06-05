import java.util.*;

public class Body{

    private int mass;
    private double xvelocity;
    private double yvelocity;
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
	return (6.67 * Math.pow(10, -26)) * other.getMass() /
	    (Math.pow(dist(other), 2));
    }

    //finds the angle between the two bodies
    private double theta(Body other){
	return Math.atan(Math.abs(getX() - other.getX())/
			 Math.abs(getY() - other.getY()));
    }

    private void force(Body other){
	//accounting for time errors
	double counter = 0.0;
	double simtime = 0.0001;
	//REMEMBER TO UNCOMMENT THIS********************************
	//counter += (1 / frameRate);
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

    private void move(){
	//REMEMBER TO UNCOMMENT THIS TOO*****************************
	//setX(getX() + xvelocity * (1 / frameRate));
	//setY(getY() + yvelocity * (1 / frameRate));
    }

    /*testing functions
    public static void main(String[] args){
	Body b = new Body(10, 0, 0, 0, 0);
	Body c = new Body(10, 3, 4, 0, 0);
	System.out.println(b.theta(c) * 180/Math.PI);
    }
    */

}
