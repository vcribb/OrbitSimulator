int x, y;
boolean _x, _y;
String message = "";

void setup(){
   size(500, 500);
   _x = false;
   _y = false;
   
}

void draw(){
  text(message, 150, 100);
  /*
  if(keyPressed){
    if(Character.getNumericValue(key) == -1){
      _x = true;
      // addBody with x
      // then set x to 0 again
    }
   // println(Character.getNumericValue(key));
    
  }
    */
}

void mousePressed(){
  message = "Input an x velocity, then press ENTER";
  
}

/*
// not sure where to put this, not under draw...
// takes keyPressed, builds a number
  if(keyPressed && Character.getNumericValue(key) != -1){
    x = x * 10 + Character.getNumericValue(key);
    println(x);
  }
*/
