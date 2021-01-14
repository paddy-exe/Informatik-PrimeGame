// Informatik-Projektarbeit

// gameScreen variable kontrolliert welcher Screen dargestellt werden soll
// 0: Menue Screen
// 1: Game Menue Screen gegen Computer
// 2: Game Screen gegen leichten Computer
// 3: Game Screen gegen mittleren Computer
// 4: Game Screen gegen schweren Computer
// 5: Game-Over Screen gegen Computer
// 6: Game Screen gegen Person
// 7: Game-Over Screen gegen Person

import processing.sound.*;
SoundFile song;

int gameScreen = 0;

int laufVariable = 1;

// color variables
color backgroundC = #EDF6F9;
color middlebluegreen = #83C5BE;
color ming = #006D77;
color unbleachedsilk = #FFDDD2;
color darksalmon = #E29578;

// button variables
MenueButton PvCOM_Play, PvCOM_leicht_Play, PvCOM_mittel_Play, PvCOM_schwer_Play, PvP_Play, backButton;

// Spielfeld variables 6x7 = 42;
final int anzahlFelderX = 6;
final int anzahlFelderY = 7;

float feldBreite;
float feldHoehe;

Einzelfeld[][] felderArray = new Einzelfeld[anzahlFelderY][anzahlFelderX];

// Gewinner variablen
int gesamtScore;
String winnerPvP;

// Spieler Liste
ArrayList<Player> player = new ArrayList();
ArrayList<COMLeicht> COMLeicht = new ArrayList();
ArrayList<COMMittel> COMMittel = new ArrayList();
ArrayList<COMSchwer> COMSchwer = new ArrayList();

/********* SETUP BLOCK *********/

void setup () {
  
  // load music
  song = new SoundFile(this, "music.mp3");
  song.loop();
  
  size(500, 500);

  // window standard settings
  textAlign(CENTER);
  rectMode(CENTER);

  // buttons
  PvCOM_Play = new MenueButton(width/2, height*0.4, width/2, height * 0.15, "Player versus COM", middlebluegreen);
  PvCOM_leicht_Play = new MenueButton(width/2, height*0.25, width/2, height * 0.15, "PvCOM Leicht", middlebluegreen);
  PvCOM_mittel_Play = new MenueButton(width/2, height*0.45, width/2, height * 0.15, "PvCOM Mittel", middlebluegreen);
  PvCOM_schwer_Play = new MenueButton(width/2, height*0.65, width/2, height * 0.15, "PvCOM Schwer", middlebluegreen);
  PvP_Play = new MenueButton(width/2, height*0.6, width/2, height * 0.15, "Player versus Player", darksalmon);
  backButton = new MenueButton((width*0.15)/2, (height*0.05)/2, width*0.15, height*0.05, "Back", ming);

  // Einzelfelder
  feldBreite = (width/anzahlFelderX * 0.8);
  feldHoehe = (height/anzahlFelderY * 0.8);

  // Felderstellung
  for (int i = 0; i < felderArray.length; i++) {
    for (int j = 0; j < felderArray[i].length; j++) {
      felderArray[i][j] = new Einzelfeld(feldBreite*float(j), feldHoehe*float(i) + 100, laufVariable, str(laufVariable), 255, false);
      gesamtScore += laufVariable;
      laufVariable++;
    }
  }
}

/********* DRAW BLOCK *********/
void draw () {
  switch(gameScreen) {
  case 0:
    menueScreen();
    break;
  case 1:
    PvCOM_Screen();
    break;
  case 2:
    PvCOM_leicht_Screen();
    break;
  case 3:
    PvCOM_mittel_Screen();
    break;
  case 4:
    PvCOM_schwer_Screen();
    break;
  case 5:
    PvCOM_GameOver_Screen();
    break;
  case 6:
    PvP_Screen();
    break;
  case 7:
    PvP_GameOver_Screen();
    break;
  }
}

/********* SCREEN CONTENTS *********/

void menueScreen() {
  background(backgroundC);
  textSize(60);
  fill(0);
  text("Prime Game", width/2, height * 0.2);
  PvCOM_Play.drawButton(CENTER, 20, CENTER, PvCOM_Play.x, PvCOM_Play.y, 0);
  PvP_Play.drawButton(CENTER, 20, CENTER, PvP_Play.x, PvP_Play.y, 0);
}

void PvCOM_Screen() {
  background(backgroundC);
  backButton.drawButton(CENTER, 15, CENTER, backButton.x, backButton.y, 255);
  PvCOM_leicht_Play.drawButton(CENTER, 20, CENTER, PvCOM_leicht_Play.x, PvCOM_leicht_Play.y, 0);
  PvCOM_mittel_Play.drawButton(CENTER, 20, CENTER, PvCOM_mittel_Play.x, PvCOM_mittel_Play.y, 0);
  PvCOM_schwer_Play.drawButton(CENTER, 20, CENTER, PvCOM_schwer_Play.x, PvCOM_schwer_Play.y, 0);
}

void PvCOM_leicht_Screen() {
  background(backgroundC);
  backButton.drawButton(CENTER, 15, CENTER, backButton.x, backButton.y, 255);
  Feldzeichnung();
  rectMode(CENTER);
  textSize(20);
  fill(player.get(0).playerColor);
  text("Player 1 Score: " + str(player.get(0).score), width/4, height * 0.15);
  fill(COMLeicht.get(0).playerColor);
  text("COM 1 Score: " + str(COMLeicht.get(0).score), width / 4 * 3, height * 0.15);
  // Farbe wieder zurück auf schwarz
  fill(0);
  Player tempOneSpieler = player.get(0);
  COMLeicht tempCOM1 = COMLeicht.get(0);

  if (tempCOM1.turn) {
    // um die Liste aktuell zu halten, muss sie vor dem erneuten Hinzufügen geleert werden
    tempCOM1.auswahlNumbers.clear();
    for (int k=0; k < felderArray.length; k++) {
      for (int l = 0; l < felderArray[k].length; l++) {

        if (felderArray[k][l].taken == false) {
          tempCOM1.auswahlNumbers.append(felderArray[k][l].index);
        }
      }
    }
    int[] auswahlArray = new int[tempCOM1.auswahlNumbers.size()];
    for (int index=0; index < tempCOM1.auswahlNumbers.size(); index++) {
      auswahlArray[index] = tempCOM1.auswahlNumbers.get(index);
    }
    int com1Auswahl = tempCOM1.auswahl(auswahlArray);
    IntList tempCOMFaktoren = faktoren(com1Auswahl);
    for (int k = 0; k < felderArray.length; k++) {
      for (int l = 0; l < felderArray[k].length; l++) {
        if (felderArray[k][l].index == com1Auswahl && felderArray[k][l].taken == false) {
          felderArray[k][l].rectColor = tempCOM1.playerColor;
          felderArray[k][l].taken = true;
          tempCOM1.score += felderArray[k][l].index;
        }
        for (int index : tempCOMFaktoren) {
          if (felderArray[k][l].index == index && felderArray[k][l].taken == false) {
              felderArray[k][l].taken = true;
              felderArray[k][l].rectColor = tempOneSpieler.playerColor;
              tempOneSpieler.score += felderArray[k][l].index;
          }
        }
      }
    }

    // overwrite player values
    tempCOM1.turn = false;
    tempOneSpieler.turn = true;
    COMLeicht.set(0, tempCOM1);
    player.set(0, tempOneSpieler);
  }
  // checkt ob der GesamtScore dem der Summe der beiden Spieler entspricht
  check_Play_vs_COM1Winner();
}

void PvCOM_mittel_Screen() {

  background(backgroundC);

  backButton.drawButton(CENTER, 15, CENTER, backButton.x, backButton.y, 255);

  Feldzeichnung();

  rectMode(CENTER);
  textSize(20);
  Player tempOneSpieler = player.get(0);
  fill(tempOneSpieler.playerColor);
  text("Player 1 Score: " + str(tempOneSpieler.score), width/4, height * 0.15);
  COMMittel tempCOM2 = COMMittel.get(0);
  fill(tempCOM2.playerColor);
  text("COM 2 Score: " + str(tempCOM2.score), width / 4 * 3, height * 0.15);

  // Farbe wieder zurück auf schwarz
  fill(0);

  if (tempCOM2.turn) {

    // um die Liste aktuell zu halten, muss sie vor dem erneuten Hinzufügen geleert werden
    tempCOM2.auswahlNumbers.clear();

    for (int k=0; k < felderArray.length; k++) {
      for (int l = 0; l < felderArray[k].length; l++) {

        if (felderArray[k][l].taken == false) {
          tempCOM2.auswahlNumbers.append(felderArray[k][l].index);
        }
      }
    }

    int[] auswahlArray = new int[tempCOM2.auswahlNumbers.size()];

    for (int index=0; index < tempCOM2.auswahlNumbers.size(); index++) {
      auswahlArray[index] = tempCOM2.auswahlNumbers.get(index);
    }

    // gibt die ausgewählte Zahl zurück
    int com2Auswahl = tempCOM2.auswahl(auswahlArray);

    IntList tempCOMFaktoren = faktoren(com2Auswahl);

    for (int k = 0; k < felderArray.length; k++) {
      for (int l = 0; l < felderArray[k].length; l++) {
        if (felderArray[k][l].index == com2Auswahl && felderArray[k][l].taken == false) {
          felderArray[k][l].rectColor = tempCOM2.playerColor;
          felderArray[k][l].taken = true;
          tempCOM2.score += felderArray[k][l].index;
        }
        for (int index : tempCOMFaktoren) {
          if (felderArray[k][l].index == index && felderArray[k][l].taken == false) {
            felderArray[k][l].taken = true;
            felderArray[k][l].rectColor = tempOneSpieler.playerColor;
            tempOneSpieler.score += felderArray[k][l].index;
          }
        }
      }
    }

    // overwrite player values
    tempCOM2.turn = false;
    tempOneSpieler.turn = true;
    COMMittel.set(0, tempCOM2);
    player.set(0, tempOneSpieler);
  }          

  // checkt ob der GesamtScore dem der Summe der beiden Spieler entspricht
  check_Play_vs_COM2Winner();
}

void PvCOM_schwer_Screen() {

  background(backgroundC);

  backButton.drawButton(CENTER, 15, CENTER, backButton.x, backButton.y, 255);

  Feldzeichnung();

  rectMode(CENTER);
  textSize(20);
  fill(player.get(0).playerColor);
  text("Player 1 Score: " + str(player.get(0).score), width/4, height * 0.15);
  fill(COMSchwer.get(0).playerColor);
  text("COM 3 Score: " + str(COMSchwer.get(0).score), width / 4 * 3, height * 0.15);

  // Farbe wieder zurück auf schwarz
  fill(0);

  Player tempOneSpieler = player.get(0);
  COMSchwer tempCOM3 = COMSchwer.get(0);

  if (tempCOM3.turn) {

    // um die Liste aktuell zu halten, muss sie vor dem erneuten Hinzufügen geleert werden
    tempCOM3.auswahlNumbers.clear();          

    for (int k=0; k < felderArray.length; k++) {
      for (int l = 0; l < felderArray[k].length; l++) {

        if (felderArray[k][l].taken == false) {
          tempCOM3.auswahlNumbers.append(felderArray[k][l].index);
        }
      }
    }

    int[] auswahlArray = new int[tempCOM3.auswahlNumbers.size()];

    for (int index=0; index < tempCOM3.auswahlNumbers.size(); index++) {
      auswahlArray[index] = tempCOM3.auswahlNumbers.get(index);
    }

    // gibt die ausgewählte Zahl zurück
    int com3Auswahl = tempCOM3.auswahl(auswahlArray);

    IntList tempCOMFaktoren = faktoren(com3Auswahl);

    for (int k = 0; k < felderArray.length; k++) {
      for (int l = 0; l < felderArray[k].length; l++) {
        if (felderArray[k][l].index == com3Auswahl && felderArray[k][l].taken == false) {
          felderArray[k][l].rectColor = tempCOM3.playerColor;
          felderArray[k][l].taken = true;
          tempCOM3.score += felderArray[k][l].index;
        }
        for (int index : tempCOMFaktoren) {
          if (felderArray[k][l].index == index && felderArray[k][l].taken == false) {
            felderArray[k][l].taken = true;
            felderArray[k][l].rectColor = tempOneSpieler.playerColor;
            tempOneSpieler.score += felderArray[k][l].index;
          }
        }
      }
    }
    // overwrite player values
    tempCOM3.turn = false;
    tempOneSpieler.turn = true;
    COMSchwer.set(0, tempCOM3);
    player.set(0, tempOneSpieler);
  }          
  // checkt ob der GesamtScore dem der Summe der beiden Spieler entspricht
  check_Play_vs_COM3Winner();
}

void PvCOM_GameOver_Screen() {
  background(backgroundC);
  backButton.drawButton(CENTER, 15, CENTER, backButton.x, backButton.y, 255);
  rectMode(CENTER);
  textSize(30);
  fill(0, 250, 0);
  text(winnerPvP + " hat gewonnen.", width/2, height/2);
  // Farbe wieder zurück auf schwarz
  fill(0);
}

void PvP_Screen() {
  background(backgroundC);
  backButton.drawButton(CENTER, 15, CENTER, backButton.x, backButton.y, 255);
  Feldzeichnung();
  rectMode(CENTER);
  textSize(20);
  fill(player.get(0).playerColor);
  text("Player 1 Score: " + str(player.get(0).score), width/4, height * 0.15);
  fill(player.get(1).playerColor);
  text("Player 2 Score: " + str(player.get(1).score), width / 4 * 3, height * 0.15);
  // Farbe wieder zurück auf schwarz
  fill(0);
}

void PvP_GameOver_Screen() {
  background(backgroundC);
  backButton.drawButton(CENTER, 15, CENTER, backButton.x, backButton.y, 255);
  rectMode(CENTER);
  textSize(30);
  fill(0, 250, 0);
  text(winnerPvP + " hat gewonnen.", width/2, height/2);
  // Farbe wieder zurück auf schwarz
  fill(0);
}

/********* INPUTS *********/

void mousePressed() {
  // if we are on the specified screen when clicked call this code
  switch(gameScreen) {
  case 0:
    if (PvCOM_Play.onButton()) {
      // change to Screen 1  
      gameScreen = 1;
    } else if (PvP_Play.onButton()) {
      // change to Screen 3  
      gameScreen = 6;

      player.add(new Player(true, middlebluegreen));
      player.add(new Player(false, darksalmon));
    }
    break;
  case 1:
    if (backButton.onButton()) {
      // change to Screen 0
      gameScreen = 0;
    } else if (PvCOM_leicht_Play.onButton()) {
      // change to PvCom_leicht
      gameScreen = 2;
      player.add(new Player(true, middlebluegreen));
      COMLeicht.add(new COMLeicht());
    } else if (PvCOM_mittel_Play.onButton()) {
      // change to PvCom_mittel
      gameScreen = 3;
      player.add(new Player(true, middlebluegreen));
      COMMittel.add(new COMMittel());
    } else if (PvCOM_schwer_Play.onButton()) {
      // change to PvCom_schwer
      gameScreen = 4;
      player.add(new Player(true, middlebluegreen));
      COMSchwer.add(new COMSchwer());
    }
    break;
  case 2:
    if (backButton.onButton()) {
      // change to Screen 0
      gameScreen = 1;
      Felderneuerung();
      player.clear();
      COMLeicht.clear();
    } else {
      Player tempOneSpieler = player.get(0);
      COMLeicht tempCOM1 = COMLeicht.get(0);
      for (int i = 0; i < felderArray.length; i++) {
        for (int j = 0; j < felderArray[i].length; j++) {
          if (tempOneSpieler.turn && felderArray[i][j].taken == false && felderArray[i][j].onClick(feldBreite, feldHoehe)) {
            felderArray[i][j].rectColor = tempOneSpieler.playerColor;
            felderArray[i][j].taken = true;
            tempOneSpieler.score += felderArray[i][j].index;
            // Faktoren der ausgewählten Zahl
            IntList tempFaktoren = faktoren(felderArray[i][j].index);
            for (int k = 0; k < felderArray.length; k++) {
              for (int l = 0; l < felderArray[k].length; l++) {
                for (int index : tempFaktoren) {
                  // wenn das Feld nicht belegt ist und der Index des Teilers gleich dessen des Einzelfeldes ist
                  if (felderArray[k][l].index == index && felderArray[k][l].taken == false) {
                    felderArray[k][l].taken = true;
                    felderArray[k][l].rectColor = tempCOM1.playerColor;
                    tempCOM1.score += felderArray[k][l].index;
                  }
                }
              }
            }
            // overwrite player values
            tempOneSpieler.turn = false;
            tempCOM1.turn = true;
            player.set(0, tempOneSpieler);
            COMLeicht.set(0, tempCOM1);
          }
        }
      }
      // checkt ob der GesamtScore dem der Summe der beiden Spieler entspricht
      check_Play_vs_COM1Winner();
    }
    break;
  case 3:
    if (backButton.onButton()) {
      // change to Screen 0
      gameScreen = 1;
      Felderneuerung();
      player.clear();
      COMMittel.clear();
    } else {
      Player tempOneSpieler = player.get(0);
      COMMittel tempCOM2 = COMMittel.get(0);
      for (int i = 0; i < felderArray.length; i++) {
        for (int j = 0; j < felderArray[i].length; j++) {

          if (tempOneSpieler.turn && felderArray[i][j].taken == false && felderArray[i][j].onClick(feldBreite, feldHoehe)) {
            felderArray[i][j].rectColor = tempOneSpieler.playerColor;
            felderArray[i][j].taken = true;
            tempOneSpieler.score += felderArray[i][j].index;

            // Faktoren der ausgewählten Zahl
            IntList tempFaktoren = faktoren(felderArray[i][j].index);

            for (int k = 0; k < felderArray.length; k++) {
              for (int l = 0; l < felderArray[k].length; l++) {
                for (int index : tempFaktoren) {
                  // wenn das Feld nicht belegt ist und der Index des Teilers gleich dessen des Einzelfeldes ist
                  if (felderArray[k][l].index == index && felderArray[k][l].taken == false) {
                    felderArray[k][l].taken = true;
                    felderArray[k][l].rectColor = tempCOM2.playerColor;
                    tempCOM2.score += felderArray[k][l].index;
                  }
                }
              }
            }
            // overwrite player values
            tempOneSpieler.turn = false;
            tempCOM2.turn = true;
            player.set(0, tempOneSpieler);
            COMMittel.set(0, tempCOM2);
          }
        }
      }
      // checkt ob der GesamtScore dem der Summe der beiden Spieler entspricht
      check_Play_vs_COM2Winner();
    }
    break;
  case 4:
    if (backButton.onButton()) {
      // change to Screen 0
      gameScreen = 1;
      Felderneuerung();
      player.clear();
      COMSchwer.clear();
    } else {
      Player tempOneSpieler = player.get(0);
      COMSchwer tempCOM3 = COMSchwer.get(0);
      for (int i = 0; i < felderArray.length; i++) {
        for (int j = 0; j < felderArray[i].length; j++) {
          if (tempOneSpieler.turn && felderArray[i][j].taken == false && felderArray[i][j].onClick(feldBreite, feldHoehe)) {
            felderArray[i][j].rectColor = tempOneSpieler.playerColor;
            felderArray[i][j].taken = true;
            tempOneSpieler.score += felderArray[i][j].index;
            // Faktoren der ausgewählten Zahl
            IntList tempFaktoren = faktoren(felderArray[i][j].index);
            for (int k = 0; k < felderArray.length; k++) {
              for (int l = 0; l < felderArray[k].length; l++) {
                for (int index : tempFaktoren) {
                  // wenn das Feld nicht belegt ist und der Index des Teilers gleich dessen des Einzelfeldes ist
                  if (felderArray[k][l].index == index && felderArray[k][l].taken == false) {
                    felderArray[k][l].taken = true;
                    felderArray[k][l].rectColor = tempCOM3.playerColor;
                    tempCOM3.score += felderArray[k][l].index;
                  }
                }
              }
            }
            // overwrite player values
            tempOneSpieler.turn = false;
            tempCOM3.turn = true;
            player.set(0, tempOneSpieler);
            COMSchwer.set(0, tempCOM3);
          }
        }
      }
      // checkt ob der GesamtScore dem der Summe der beiden Spieler entspricht
      check_Play_vs_COM3Winner();
    }
    break;
  case 5:
    if (backButton.onButton()) {
      // change to Screen 0
      gameScreen = 1;
      Felderneuerung();
      // Clear player Lists
      player.clear();
      COMLeicht.clear();
      COMMittel.clear();
      COMSchwer.clear();
    }
    break;
  case 6:
    if (backButton.onButton()) {
      // change to Screen 0
      gameScreen = 0;  
      Felderneuerung();
      // Clear player Lists to reset all values
      player.clear();
    } else {
      for (int i = 0; i < felderArray.length; i++) {
        for (int j = 0; j < felderArray[i].length; j++) {
          Player tempOneSpieler = player.get(0);
          Player tempTwoSpieler = player.get(1);
          if (tempOneSpieler.turn && felderArray[i][j].taken == false && felderArray[i][j].onClick(feldBreite, feldHoehe)) {
            felderArray[i][j].rectColor = tempOneSpieler.playerColor;
            felderArray[i][j].taken = true;
            tempOneSpieler.score += felderArray[i][j].index;
            // Faktoren der ausgewählten Zahl
            IntList tempFaktoren = faktoren(felderArray[i][j].index);
            for (int k = 0; k < felderArray.length; k++) {
              for (int l = 0; l < felderArray[k].length; l++) {
                for (int index : tempFaktoren) {
                  // wenn das Feld nicht belegt ist und der Index des Teilers gleich dessen des Einzelfeldes ist
                  if (felderArray[k][l].index == index && felderArray[k][l].taken == false) {
                    felderArray[k][l].taken = true;
                    felderArray[k][l].rectColor = tempTwoSpieler.playerColor;
                    tempTwoSpieler.score += felderArray[k][l].index;
                  }
                }
              }
            }
            // overwrite player values
            tempOneSpieler.turn = false;
            tempTwoSpieler.turn = true;
            player.set(0, tempOneSpieler);
            player.set(1, tempTwoSpieler);
          } else if (tempTwoSpieler.turn && felderArray[i][j].taken == false && felderArray[i][j].onClick(feldBreite, feldHoehe)) {
            felderArray[i][j].rectColor = tempTwoSpieler.playerColor;
            felderArray[i][j].taken = true;
            tempTwoSpieler.score += felderArray[i][j].index;
            // Faktoren der ausgewählten Zahl
            IntList tempTwoFaktoren = faktoren(felderArray[i][j].index);
            for (int k = 0; k < felderArray.length; k++) {
              for (int l = 0; l < felderArray[k].length; l++) {
                for (int index : tempTwoFaktoren) {
                  if (felderArray[k][l].index == index && felderArray[k][l].taken == false) {
                    felderArray[k][l].taken = true;
                    felderArray[k][l].rectColor = tempOneSpieler.playerColor;
                    tempOneSpieler.score += felderArray[k][l].index;
                  }
                }
              }
            }
            // overwrite player values
            tempTwoSpieler.turn = false;
            tempOneSpieler.turn = true;
            player.set(1, tempTwoSpieler);
            player.set(0, tempOneSpieler);
          }
        }
      }
      Player tempEinsSpieler = player.get(0);
      Player tempZweiSpieler = player.get(1);

      if (tempEinsSpieler.score + tempZweiSpieler.score == gesamtScore) {
        if (tempEinsSpieler.score > tempZweiSpieler.score) {
          winnerPvP = tempEinsSpieler.getPlayerName();
          gameScreen = 7;
        } else if (tempZweiSpieler.score > tempEinsSpieler.score) {
          winnerPvP = tempZweiSpieler.getPlayerName();
          gameScreen = 7;
        } else {
          winnerPvP = "Keiner";
          gameScreen = 7;
        }
      }
    }
    break;
  case 7:
    if (backButton.onButton()) {
      // change to Screen 0
      gameScreen = 0;
      Felderneuerung();
      // Clear player List
      player.clear();
    }
    break;
  }
}

/********* OTHER FUNCTIONS *********/
// Gibt eine Liste der Faktoren der eingegebenen Nummer zurück
IntList faktoren (int number) {
  IntList faktoren = new IntList();
  for (int loopCounter = 1; loopCounter < number; loopCounter++) {
    // check if remainder of division is 0
    if (number % loopCounter == 0) {
      faktoren.append(loopCounter);
    }
  }
  return faktoren;
}

// Zeichnet alle Einzelfelder
void Feldzeichnung() {
  rectMode(CORNER);
  textAlign(CENTER);
  textSize(12);

  // zeichnet alle Einzelfelder
  for (int i = 0; i < felderArray.length; i++) {
    for (int j = 0; j < felderArray[i].length; j++) {
      felderArray[i][j].draw(felderArray[i][j].posX, felderArray[i][j].posY, feldBreite, feldHoehe, felderArray[i][j].label);
    }
  }
}

// Ersetzt alle Einzelfelder durch neue
void Felderneuerung() {
  // erneute Felderstellung
  laufVariable = 1;
  for (int i = 0; i < felderArray.length; i++) {
    for (int j = 0; j < felderArray[i].length; j++) {
      // delete all values from each Einzelfeld object
      felderArray[i][j] = null;
      // create new Einzelfeld object for replacement
      felderArray[i][j] = new Einzelfeld(feldBreite*float(j), feldHoehe*float(i) + 100, laufVariable, str(laufVariable), 255, false);
      laufVariable++;
    }
  }
}

void check_Play_vs_COM1Winner () {
  if (player.get(0).score + COMLeicht.get(0).score == gesamtScore) {  
    if (player.get(0).score > COMLeicht.get(0).score) {
      winnerPvP = player.get(0).getPlayerName();
      gameScreen = 5;
    } else if (COMLeicht.get(0).score > player.get(0).score) {
      winnerPvP = COMLeicht.get(0).getPlayerName();
      gameScreen = 5;
    } else {
      winnerPvP = "Keiner";
      gameScreen = 5;
    }
  }
}

void check_Play_vs_COM2Winner () {
  if (player.get(0).score + COMMittel.get(0).score == gesamtScore) {  

    if (player.get(0).score > COMMittel.get(0).score) {
      winnerPvP = player.get(0).getPlayerName();
      gameScreen = 5;
    } else if (COMMittel.get(0).score > player.get(0).score) {
      winnerPvP = COMMittel.get(0).getPlayerName();
      gameScreen = 5;
    } else {
      winnerPvP = "Keiner";
      gameScreen = 5;
    }
  }
}

void check_Play_vs_COM3Winner() {
  if (player.get(0).score + COMSchwer.get(0).score == gesamtScore) {  
    if (player.get(0).score > COMSchwer.get(0).score) {
      winnerPvP = player.get(0).getPlayerName();
      gameScreen = 5;
    } else if (COMSchwer.get(0).score > player.get(0).score) {
      winnerPvP = COMSchwer.get(0).getPlayerName();
      gameScreen = 5;
    } else {
      winnerPvP = "Keiner";
      gameScreen = 5;
    }
  }
}
