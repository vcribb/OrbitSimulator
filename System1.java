import java.util.*;
import java.lang.*;

public class System1{

    private ArrayList<Body> bodies;

    public System1(){
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
