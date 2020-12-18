

class SpielfeldAufbau {


  int anzahlFelderX = 10;
  int anzahlFelderY = 12;
  int felderGesamt = anzahlFelderX * anzahlFelderY;
  float x = width/8;
  float y = height/6;
  float breite = width-2*width/8;
  float hoehe = height-2*height/6;
  int[][] felderArray = new int[anzahlFelderX][anzahlFelderY];
  int laufvariableFeld = 1;
  float feldHoehe = height/15;
  float feldBreite = width/20;
  float abstandRandX = (width-feldBreite*(anzahlFelderX+2))/2;
  float abstandRandY = (height-feldHoehe*(anzahlFelderY-2))/2;
  int index1;
  int index2;


  SpielfeldAufbau() {
  }

  SpielfeldAufbau(int rM, int sW, int breite, int hoehe) {
    
  }

  //Felder(int[][] felderArray, int anzahlFelderX, int anzahlFelderY) {
  //  this.felderArray = felderArray;
  //  this.anzahlFelderX = anzahlFelderX;
  //  this.anzahlFelderY = anzahlFelderY;
  //}



  //void umrandungZellen() {
  //  for (int i = 0; i < felderGesamt; i++) {
  //    rect(feldHoehe*anzahlFelderX
  //  }





  void zellenDurchlauf() {
    rectMode(CENTER);
    strokeWeight(3);
    stroke(0);
    textMode(CENTER);
    textSize(30);
    for (int i = 0; i < felderArray.length; i++) {
      for (int j = 0; j <felderArray[i].length; j++) {
        print(felderArray[i][j] = laufvariableFeld);
        print(" ");
        fill(random(0, 256), random(230, 256), random(0, 256));
        rect(abstandRandX + feldBreite*j ,abstandRandY + feldHoehe*i , feldBreite* j-feldBreite*(j-1), feldHoehe* i-feldHoehe*(i-1));
        fill(0);
        if (laufvariableFeld < 10) {
          text(laufvariableFeld, abstandRandX + feldBreite*j - feldBreite/10 ,abstandRandY + feldHoehe*i + feldHoehe/5);
        }
        else if (laufvariableFeld > 99) {
        text(laufvariableFeld, abstandRandX + feldBreite*j - feldBreite/3.5 ,abstandRandY + feldHoehe*i + feldHoehe/5);  
        }
        else {
        text(laufvariableFeld, abstandRandX + feldBreite*j - feldBreite/5 ,abstandRandY + feldHoehe*i + feldHoehe/5);
        }
        laufvariableFeld++;
        index1 = i;
        index2 = j;
      }
      println();
    }
  }
}


void zellenAuswahl() {
}
