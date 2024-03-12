class Blues {
  Puppet [] pupp = new Puppet [4];
  int finito = -1;

  Blues() {
    pupp[0] = new Puppet(18 * standard, 18 * standard, #0000ff, 30);
    pupp[1] = new Puppet(20 * standard, 18 * standard, #0000ff, 30);
    pupp[2] = new Puppet(18 * standard, 20 * standard, #0000ff, 30);
    pupp[3] = new Puppet(20 * standard, 20 * standard, #0000ff, 30);
  }

  void display() {
    for (int i = 0; i < pupp.length; i++) {
      pupp[i].display();
    }
  }

  boolean samePlace(int i) {
    boolean same = false;
    for (int k = 0; k < pupp.length; k++) {
      if ((pupp[i].pos+kocka.diceNum == pupp[k].pos) || ((pupp[i].pos+kocka.diceNum)-40 == pupp[k].pos) || (!pupp[i].onBoard && pupp[k].pos-pupp[k].modi == 0)) {
        same = true;
        break;
      }
    }  
    return same;
  }

  void test() {
    for (int i = 0; i< pupp.length; i++) {
      if (dist(pupp[i].x, pupp[i].y, mouseX, mouseY)<=standard/2 && pupp[i].pos<1000) {
        if (pupp[i].pos < 30 && pupp[i].pos+kocka.diceNum >= 30) {
          end(i);
        } else if (!samePlace(i)) {
          pupp[i].move();
          for (int j = 0; j < 4; j++) { 
            if (pupp[i].pos == reds.pupp[j].pos) {
              reds.pupp[j].reset();
            }
            if (pupp[i].pos == greens.pupp[j].pos) {
              greens.pupp[j].reset();
            }
            if (pupp[i].pos == yellows.pupp[j].pos) {
              yellows.pupp[j].reset();
            }
          }
        }
      }
    }
  }
  
  void end(int num){
    finito += 1;
    pupp[num].x = tabla.fin[finito+12].x;
    pupp[num].y = tabla.fin[finito+12].y;
    pupp[num].onBoard = false;
    pupp[num].pos = 1000;
    if (finito == pupp.length-1){
      round = 13;
      end = true;
    } else stepControl();
  }
  
}
