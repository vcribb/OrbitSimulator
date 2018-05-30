import java.util.*;
import java.lang.*;

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
    }
    
}
