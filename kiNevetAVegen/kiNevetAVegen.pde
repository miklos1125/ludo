
int standard = 30;
byte round = 0;
Board tabla = new Board();
Dice kocka = new Dice();
Reds reds;
Greens greens;
Yellows yellows;
Blues blues;
PImage bg;

  Buttons redBut = new Buttons(-4*standard, 4*standard , #ff0000, null);
  Buttons greenBut = new Buttons(-4*standard, -4*standard, #00ff00, null);
  Buttons yellowBut = new Buttons( 4*standard, -4*standard, #ffff00, null);
  Buttons blueBut = new Buttons(4*standard, +4*standard, #0000ff, null);
  Buttons whiteBut = new Buttons(0, 0, #ffffff, "START");
Buttons [] allBut = {redBut, greenBut, yellowBut, blueBut, whiteBut};

boolean end = false;
boolean first = true;

import java.io.RandomAccessFile;
RandomAccessFile raf;

void setup() {
  size(1100,720);
  smooth();
  reds = new Reds();
  greens = new Greens();
  yellows = new Yellows();
  blues = new Blues();
  bg = loadImage("data/tabletop.jpg");
  bg.resize(width, height);
}

void draw() {
  if(whiteBut.on){
    if(first) firstRound();
    background(bg);
    tabla.show();
    reds.display();
    greens.display();
    yellows.display();
    blues.display();
    kocka.display();
    fill(255);
    text (round, 0,0);
  }else{
    push();
    translate(width/2, height/2);
    startScreen();
    pop();
  }
}

void mousePressed() {
  if (whiteBut.on){
    gameMouse();
  } else {
    startMouse();
  }
}

void gameMouse(){
  if (!end) {
    if (round % 2 == 0) { 
      if (mouseX >= kocka.x - 50 && mouseX <= kocka.x +50 && mouseY >= kocka.y-50 && mouseY <= kocka.y+50) {
        kocka.dob(mouseX, mouseY);
      }
    } else if (round == 1) {
      reds.test();
    } else if (round == 3) {
      greens.test();
    } else if (round == 5) {
      yellows.test();
    } else if (round == 7) {
      blues.test();
    }
  }
}

void startMouse(){
  
  for (int i = 0; i < allBut.length; i++){
    if(dist(allBut[i].x, allBut[i].y, mouseX-width/2, mouseY-height/2) <= 1.5*standard){
      if (allBut[i].on){
        allBut[i].on = false;
      } else {
        allBut[i].on = true;
      }
    }
  }
  
}

void firstRound(){
  if (redBut.on){
    round = 0;
    first = false;
  } else if (greenBut.on){
    round = 2;
    first = false;
  } else if (yellowBut.on){
    round = 4;
    first = false;
  } else if (blueBut.on){
    round = 6;
    first = false;
  } else {
    whiteBut.on = false;
  }
}

void stepControl() {
  // round = 0 piros dob
  // 1 piros lép
  // 2 zöld dob
  // 3 zöld lép
  // 4 sárga dob
  // 5 sárga lép
  // 6 kék dob
  // 7 kék lép
  if (kocka.diceNum == 6 && round % 2 != 0) {
    round -= 1;
  } else {
    round += 1;
    if (round == 8) round = 0;
  }
  

  //lehet rövidebben? - ugrik, ha nem tud lépni
  if (round == 1 && (kocka.diceNum>1 && kocka.diceNum<6)) {
    int a = 0;
    for (int i = 0; i < reds.pupp.length; i++) {
      if (!reds.pupp[i].onBoard) {
        a += 1;
      }
    }
    if (a == 4) round = 2;
  }
  if (round == 3 && (kocka.diceNum>1 && kocka.diceNum<6)) {
    int a = 0;
    for (int i = 0; i < greens.pupp.length; i++) {
      if (!greens.pupp[i].onBoard) {
        a += 1;
      }
    }
    if (a == 4) round = 4;
  }
  if (round == 5 && (kocka.diceNum>1 && kocka.diceNum<6)) {
    int a = 0;
    for (int i = 0; i < yellows.pupp.length; i++) {
      if (!yellows.pupp[i].onBoard) {
        a += 1;
      }
    }
    if (a == 4) round = 6;
  }
  if (round == 7 && (kocka.diceNum>1 && kocka.diceNum<6)) {
    int a = 0;
    for (int i = 0; i < blues.pupp.length; i++) {
      if (!blues.pupp[i].onBoard) {
        a += 1;
      }
    }
    if (a == 4) round = 0;
  } //ugrik, ha nem tud lépni VÉGE
  
  //Játékosszám
  if(!redBut.on && (round == 0 || round == 1)){
    round = 2;
  }
    if(!greenBut.on && (round == 2 || round == 3)){
    round = 4;
  }
    if(!yellowBut.on && (round == 4 || round == 5)){
    round = 6;
  }
    if(!blueBut.on && (round == 6 || round == 7)){
    round = 7;
    stepControl();
  }

}

void keyPressed() {
  if (keyCode == ENTER) {
    stepControl();
    stepControl();
  }
  if (keyCode == SHIFT){
    stepControl();
  }
  if (key == 's' || key == 'S'){
  saveGame();
  }
  if (key == 'l' || key == 'S'){
  loadGame();
  }
}

void startScreen(){
  background(0);
  fill(#ffffff);
  textSize(30);
  textAlign(CENTER);
  text("Válassz színt mindegyik játékosnak!", 0, -height*0.4);
  text("Ha kész, klikkelj a start gombra!", 0, -height*0.35);
  for(int i= 0; i<allBut.length-1; i++){
    allBut[i].show();
  }
  if(redBut.on || greenBut.on || yellowBut.on || blueBut.on){
    whiteBut.show();
  }

}

void  saveGame(){
  try{
    raf = new RandomAccessFile("savegame.txt", "rw");
    String temp ="";
    
    for (int i = 0; i < allBut.length; i++){
      temp = temp + String.valueOf(allBut[i].on) + "\r\n";
    }
    
    temp = temp + String.valueOf(kocka.diceNum) + "\r\n";
    temp = temp + String.valueOf(kocka.x) + "\r\n";
    temp = temp + String.valueOf(kocka.y) + "\r\n";
    temp = temp + String.valueOf(round) + "\r\n";
    temp = temp + String.valueOf(first) + "\r\n";
    temp = temp + String.valueOf(end) + "\r\n";
    
    
    temp = temp + String.valueOf(reds.finito) + "\r\n";
    temp = temp + String.valueOf(greens.finito) + "\r\n";
    temp = temp + String.valueOf(yellows.finito) + "\r\n";
    temp = temp + String.valueOf(blues.finito) + "\r\n";
    
    
    for(int i = 0; i < reds.pupp.length; i ++){
      temp = temp + String.valueOf(reds.pupp[i].pos) + "\r\n";
      temp = temp + String.valueOf(reds.pupp[i].x) + "\r\n";
      temp = temp + String.valueOf(reds.pupp[i].y) + "\r\n";
      temp = temp + String.valueOf(reds.pupp[i].onBoard) + "\r\n";
      
      temp = temp + String.valueOf(greens.pupp[i].pos) + "\r\n";
      temp = temp + String.valueOf(greens.pupp[i].x) + "\r\n";
      temp = temp + String.valueOf(greens.pupp[i].y) + "\r\n";
      temp = temp + String.valueOf(greens.pupp[i].onBoard) + "\r\n";
      
      temp = temp + String.valueOf(yellows.pupp[i].pos) + "\r\n";
      temp = temp + String.valueOf(yellows.pupp[i].x) + "\r\n";
      temp = temp + String.valueOf(yellows.pupp[i].y) + "\r\n";
      temp = temp + String.valueOf(yellows.pupp[i].onBoard) + "\r\n";
      
      temp = temp + String.valueOf(blues.pupp[i].pos) + "\r\n";
      temp = temp + String.valueOf(blues.pupp[i].x) + "\r\n";
      temp = temp + String.valueOf(blues.pupp[i].y) + "\r\n";
      temp = temp + String.valueOf(blues.pupp[i].onBoard) + "\r\n";
    }  
    
    print(temp);
    raf.writeBytes(temp);
    raf.close();
  }
  
  catch(Exception e){
    println("A kiírás nem sikerült.");
  }
}

void loadGame(){
  try{
    raf = new RandomAccessFile("savegame.txt", "r");
    
    for (int i = 0; i < allBut.length; i++){
      allBut[i].on = boolean(raf.readLine());
    }
    
    kocka.diceNum = int(raf.readLine());
    kocka.x = int(raf.readLine());
    kocka.y = int(raf.readLine());
    round = (byte)int(raf.readLine());
    first = boolean(raf.readLine());
    end = boolean(raf.readLine());
    
    
    reds.finito = int(raf.readLine());
    greens.finito = int(raf.readLine());
    yellows.finito = int(raf.readLine());
    blues.finito = int(raf.readLine());
    
    
    for(int i = 0; i < reds.pupp.length; i ++){
      reds.pupp[i].pos = int(raf.readLine());
      reds.pupp[i].x = int(raf.readLine());
      reds.pupp[i].y = int(raf.readLine());
      reds.pupp[i].onBoard = boolean(raf.readLine());
      
      greens.pupp[i].pos = int(raf.readLine());
      greens.pupp[i].x = int(raf.readLine());
      greens.pupp[i].y = int(raf.readLine());
      greens.pupp[i].onBoard = boolean(raf.readLine());
      
      yellows.pupp[i].pos = int(raf.readLine());
      yellows.pupp[i].x = int(raf.readLine());
      yellows.pupp[i].y = int(raf.readLine());
      yellows.pupp[i].onBoard = boolean(raf.readLine());
      
      blues.pupp[i].pos = int(raf.readLine());
      blues.pupp[i].x = int(raf.readLine());
      blues.pupp[i].y = int(raf.readLine());
      blues.pupp[i].onBoard = boolean(raf.readLine());
    }  
    //raf.setLength(raf.getFilePointer()); //Ez nem tudom mi.
    raf.close();
  }
  
  catch(Exception e){
    println("A beolvasás nem sikerült: ");
  }
}
