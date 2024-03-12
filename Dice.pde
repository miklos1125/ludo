class Dice {

  int diceNum=1;
  int x=30*standard;
  int y=15*standard;

  Dice() {
  }

  void dob(int x, int y) {
    diceNum = (int) (Math.random()*6+1);
    this.x = constrain(x, width-300, width-100);
    this.y = constrain(y, 250, height-100);
    stepControl();
  }

  void display() {
    strokeWeight(6);
    //if (round == 0){
    //  stroke(#ff0000);
    //} else if (round == 2){
    //  stroke(#00ff00);
    //} else if (round == 4){
    //  stroke(#ffff00);
    //} else if (round == 6){
    //  stroke(#0000ff);
    //} else 
    rectMode (CENTER);
    noStroke();
    fill(0,50);
    rect(x+20, y+30, 100, 100);
    stroke(120);
    fill(255);
    rect(x, y, 100, 100) ;
    strokeWeight(1);
    if (round == 1){
      fill(#ff0000);
    } else if (round == 3){
      fill(#00ff00);
    } else if (round == 5){
      fill(#ffff00);
    } else if (round == 7){
      fill(#0000ff);
    } else fill(0);
    
    noStroke();
    switch(diceNum) {
      case (1):
      ellipse (x, y, 20, 20);
      break;
      case (2):
      ellipse (x-25, y-25, 20, 20);
      ellipse (x+25, y+25, 20, 20);
      break;
      case (3):
      ellipse (x-25, y-25, 20, 20);
      ellipse (x, y, 20, 20);
      ellipse (x+25, y+25, 20, 20);
      break;
      case (4):
      ellipse (x-25, y-25, 20, 20);
      ellipse (x-25, y+25, 20, 20);
      ellipse (x+25, y-25, 20, 20);
      ellipse (x+25, y+25, 20, 20);
      break;
      case (5):
      ellipse (x-25, y-25, 20, 20);
      ellipse (x-25, y+25, 20, 20);
      ellipse (x+25, y-25, 20, 20);
      ellipse (x+25, y+25, 20, 20);
      ellipse (x, y, 20, 20);
      break;
      case (6):
      ellipse (x-25, y-25, 20, 20);
      ellipse (x-25, y+25, 20, 20);
      ellipse (x+25, y-25, 20, 20);
      ellipse (x+25, y+25, 20, 20);
      ellipse (x-25, y, 20, 20);
      ellipse (x+25, y, 20, 20);
      break;
    }
  }
}
