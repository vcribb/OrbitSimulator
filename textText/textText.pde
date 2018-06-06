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
  println("mouse");
 // x = input(0);
 // y = input(0);
}

int input(int a){
   while (!_x){
     a = a * 10 + Character.getNumericValue(key);
     println(a);
     if(Character.getNumericValue(key) == -1){
       _x = true;
     }
   }
   return a;
}
