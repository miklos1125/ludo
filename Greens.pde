class Greens {
  Puppet [] pupp = new Puppet [4];
  int finito = -1;

  Greens() {
    pupp[0] = new Puppet(4 * standard, 4 * standard, #00ff00, 10);
    pupp[1] = new Puppet(6 * standard, 4 * standard, #00ff00, 10);
    pupp[2] = new Puppet(4 * standard, 6 * standard, #00ff00, 10);
    pupp[3] = new Puppet(6 * standard, 6 * standard, #00ff00, 10);
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
        if (pupp[i].pos < 10 && pupp[i].pos+kocka.diceNum >= 10) {
          end(i);
        } else if (!samePlace(i)){
          pupp[i].move();
          for (int j = 0; j < 4; j++) { 
            if (pupp[i].pos == reds.pupp[j].pos) {
              reds.pupp[j].reset();
            }
            if (pupp[i].pos == yellows.pupp[j].pos) {
              yellows.pupp[j].reset();
            }
            if (pupp[i].pos == blues.pupp[j].pos) {
              blues.pupp[j].reset();
            }
          }
        }
      }
    }
  }

  void end(int num) {
    finito += 1;
    pupp[num].x = tabla.fin[finito+4].x;
    pupp[num].y = tabla.fin[finito+4].y;
    pupp[num].onBoard = false;
    pupp[num].pos = 1000;
    if (finito == pupp.length-1) {
      round = 11;
      end = true;
    } else stepControl();
  }
  
}
