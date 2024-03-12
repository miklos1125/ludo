class Board{
  
  Place [] places = new Place [40];
  Finish [] fin = new Finish [16];
  
  Board() {
    
    int a = 12*standard;
    int b = 22*standard;
    for (int i = 0; i<places.length; i++){
      if (i>0 && i<5){
        b = b - 2*standard;
      } else if (i<9){
        a = a - 2*standard;
      } else if (i<11){
        b = b - 2*standard;
      } else if (i<15){
        a = a + 2*standard;
      } else if (i<19){
        b = b - 2*standard;
      } else if (i<21){
        a = a + 2*standard;
      } else if (i<25){
        b = b + 2*standard;
      } else if (i<29){
        a = a + 2*standard;
      } else if (i<31){
        b = b + 2*standard;
      } else if (i<35){
        a = a - 2*standard;
      } else if (i<39){
        b = b + 2*standard;
      } else {
        a = a - 2*standard;
      }
      places[i] = new Place(a, b);
      }
      places[0].setColor(#ff0000);
      places[10].setColor(#00ff00);
      places[20].setColor(#ffff00);
      places[30].setColor(#0000ff);
      
      
      for (int i = 0; i < fin.length; i++){
        if (i<4){
         fin[i] = new Finish(12*standard, 20*standard - i*2*standard);
         fin[i].setColor(#ff0000);
        } else if (i<8){
         fin[i] = new Finish(4*standard + (i-4)*2*standard, 12*standard);
         fin[i].setColor(#00ff00);
        } else if (i<12){
         fin[i] = new Finish(12*standard, 4*standard + (i-8)*2*standard);
         fin[i].setColor(#ffff00);
        } else {
         fin[i] = new Finish(20*standard - (i-12)*2*standard, 12*standard);
         fin[i].setColor(#0000ff);
        }
      
      }
    } //konstruktor vége
  
   
  void show() {
    for(int i=0; i<places.length; i++) {
      places[i].display();
    }
    
    for(int i=0; i<fin.length; i++) {
      fin[i].display();
    }
    strokeWeight(4);
    stroke(#ff0000);
    if (round == 1 &&(kocka.diceNum == 1 || kocka.diceNum == 6)) {
      fill(#ff0000, 120);
    } else fill(0, 0);
    ellipse(5*standard, 19*standard, 5*standard, 5*standard);
    
    stroke(#00ff00);
    if (round == 3 &&(kocka.diceNum == 1 || kocka.diceNum == 6)) {
      fill(#00ff00, 120);
    } else fill(0, 0);
    ellipse(5*standard, 5*standard, 5*standard, 5*standard);
    
    stroke(#ffff00);
    if (round == 5 &&(kocka.diceNum == 1 || kocka.diceNum == 6)) {
      fill(#ffff00, 120);
    } else fill(0, 0);
    ellipse(19*standard, 5*standard, 5*standard, 5*standard);
    
    stroke(#0000ff);
    if (round == 7 &&(kocka.diceNum == 1 || kocka.diceNum == 6)) {
      fill(#0000ff, 120);
    } else fill(0, 0);
    ellipse(19*standard, 19*standard, 5*standard, 5*standard);
    
    textSize(30);
    switch (round){
      case 0:
        fill(#ff0000);
        text("A piros játékos dob.", width*0.65, height*0.20);
        break;
      case 1:
        fill(#ff0000);
        text("A piros játékos lép.", width*0.65, height*0.20);
        break;
      case 2:
        fill(#00ff00);
        text("A zöld játékos dob.", width*0.65, height*0.20);
        break;
      case 3:
        fill(#00ff00);
        text("A zöld játékos lép.", width*0.65, height*0.20);
        break;
      case 4:
        fill(#ffff00);
        text("A sárga játékos dob.", width*0.65, height*0.20);
        break;
      case 5:
        fill(#ffff00);
        text("A sárga játékos lép.", width*0.65, height*0.20);
        break;
      case 6:
        fill(#0000ff);
        text("A kék játékos dob.", width*0.65, height*0.20);
        break;
      case 7:
        fill(#0000ff);
        text("A kék játékos lép.", width*0.65, height*0.20);
        break;
      case 10:
        fill(#ff0000);
        text("A piros játékos nyert.", width*0.65, height*0.20);
        break;
      case 11:
        fill(#00ff00);
        text("A zöld játékos nyert.", width*0.65, height*0.20);
        break;
      case 12:
        fill(#ffff00);
        text("A sárga játékos nyert.", width*0.65, height*0.20);
        break;
      case 13:
        fill(#0000ff);
        text("A kék játékos nyert.", width*0.65, height*0.20);
        break;
    }
    arrow(places[0].x, places[0].y, 'n');
    arrow(places[10].x, places[10].y, 'e');
    arrow(places[20].x, places[20].y, 's');
    arrow(places[30].x, places[30].y, 'w');
  }
  
  void arrow(int x, int y, char way){
    int half = standard/2;
    strokeWeight(2);
    stroke(255);
    fill(255);
    push();
    translate(x, y);
    if (way == 'e'){
      rotate(radians(90));
    } else if (way =='s'){
      rotate(radians(180));
    } else if ( way == 'w'){
      rotate(radians(270));
    }
    beginShape();
    vertex(0, -half);
    vertex(-half/2, -half/2);
    vertex(-half*0.1, -half/2);
    vertex(-half*0.1, half);
    vertex(half*0.1, half);
    vertex(half*0.1, -half/2);
    vertex(half/2, -half/2);
    endShape(CLOSE);
    pop();
    strokeWeight(1);
  }
  
  class Place{
    int x, y;
    private color col = color(255,0);
    
    Place(int tempX, int tempY){
      this.x = tempX;
      this.y = tempY;
    } 
      
    void display() {
      rectMode(CENTER);
      strokeWeight(5);
      stroke(255);
      fill(col);
      rect(x, y, 2*standard, 2*standard);
    }
    
    void setColor(color tempCol) {
      this.col = tempCol;
      
    }
  
  }
  class Finish{
    int x, y;
    private color col = color(0);
    
    Finish(int tempX, int tempY){
      this.x = tempX;
      this.y = tempY;
    } 
      
    void display() {
      stroke(col);
      strokeWeight(2);
      noFill();
      ellipse(x, y, 1.8*standard, 1.8*standard);
    }
    
    void setColor(color tempCol) {
      this.col = tempCol;
      
    }
  
  }
  
}
