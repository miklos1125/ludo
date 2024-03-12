class Puppet{
  boolean toStep, onBoard;
  int x, y;
  int startX, startY;
  int pos=-100;
  int modi;
  color col;
  
  Puppet(int x, int y, color col, int modi) {
    this.x = x;
    this.y = y;
    this.col = col;
    this.modi = modi;
    startX = x;
    startY = y;
  }
  
  void display(){
    noStroke();
    fill(0,77);
    ellipse(x+5, y+8, standard*1.1, standard*1.1);
    stroke(0);
    fill(col);
    strokeWeight(3);
    ellipse(x, y, standard, standard);
    strokeWeight(1);
  }
  
  void move(){
    if (! onBoard){
      if (kocka.diceNum == 6 || kocka.diceNum == 1){
        onBoard = true;
        pos = 0+modi;
        x = tabla.places[pos].x;
        y = tabla.places[pos].y;
        stepControl();
      }
    } else {
      pos += kocka.diceNum;
      if (pos>=40){
        pos = pos-40;
      }
      x = tabla.places[pos].x;
      y = tabla.places[pos].y;
      stepControl();
    }
  }
  
  void reset(){
    x = startX;
    y = startY;
    onBoard = false;
    pos=-100;
  }
}
