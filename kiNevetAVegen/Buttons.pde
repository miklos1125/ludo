class Buttons{
   int x, y;
   color col;
   boolean on = false;
   String miez;
  
 Buttons(int x, int y, color col, String miez){
   this.x = x;
   this.y = y;
   this.col = col;
   this.miez = miez;
 }
   
   void show(){
     strokeWeight(3);
     if (on){
       stroke(255);
       fill(col);
     } else {
       stroke(110);
       fill(col, 200);
     }
     ellipse (x, y, 3*standard, 3*standard);
     strokeWeight(1);
     fill(0);
     textAlign(CENTER, CENTER);
     textSize(20);
     if(miez!=null) text(miez, x, y);
   }
 
}
