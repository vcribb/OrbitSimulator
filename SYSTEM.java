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
	    for (int y = 0; y < bodies.size(); y++){
		getBody(x).orbit(getBody(y));
	    }
	}
    }
    
}
