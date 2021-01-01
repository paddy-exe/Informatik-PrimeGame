// Informatik-Projektarbeit

// gameScreen variable kontrolliert welcher Screen dargestellt werden soll
// 0: Menue Screen
// 1: Game Screen gegen Computer
// 2: Game-Over Screen gegen Computer
// 3: Game Screen gegen Person
// 4: Game-Over Screen gegen Person

int gameScreen = 0;

int laufVariable = 1;

// color variables
color backgroundC = #EDF6F9;
color middlebluegreen = #83C5BE;
color ming = #006D77;
color unbleachedsilk = #FFDDD2;
color darksalmon = #E29578;

// button variables
MenueButton PvCOM_Play, PvP_Play, backButton;

// Spielfeld variables
final int anzahlFelderX = 6;
final int anzahlFelderY = 6;

float feldBreite;
float feldHoehe;

Einzelfeld[][] felderArray = new Einzelfeld[anzahlFelderY][anzahlFelderX];

// Spieler Variablen Listen
ArrayList<Spieler> player;
//ArrayList<PlayerTwo> player2;
//ArrayList<COM1> com1;
//ArrayList<COM2> com2;
//ArrayList<COM3> com3;

/********* SETUP BLOCK *********/

void setup () {
  size(500, 500);
  //fullScreen();

  // window standard settings
  textAlign(CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  // buttons
  PvCOM_Play = new MenueButton(width/2, height*0.4, width/2, height * 0.15, "Player versus COM", middlebluegreen);
  PvP_Play = new MenueButton(width/2, height*0.6, width/2, height * 0.15, "Player versus Player", darksalmon);
  backButton = new MenueButton((width*0.15)/2, (height*0.05)/2, width*0.15, height*0.05, "Back", ming);


  // Einzelfelder
  feldBreite = (width/anzahlFelderX * 0.8);
  
  feldHoehe = (height/anzahlFelderY * 0.8);
  
  // Felderstellung
  for (int i = 0; i < felderArray.length; i++) {
    for (int j = 0; j < felderArray[i].length; j++) {
      felderArray[i][j] = new Einzelfeld(feldBreite*float(j), feldHoehe*float(i) + 100, laufVariable, str(laufVariable), 255);
      print(felderArray[i][j].index);
      print(" ");
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
    PvCOM_GameOver_Screen();
    break;
  case 3:
    PvP_Screen();
    break;
  case 4:
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
  
  
  rectMode(CORNER);
  textAlign(CENTER);
  textSize(12);
  
  // zeichnet alle Einzelfelder
  for (int i = 0; i < felderArray.length; i++) {
    for (int j = 0; j < felderArray[i].length; j++) {
      
      felderArray[i][j].draw(felderArray[i][j].posX,felderArray[i][j].posY,feldBreite,feldHoehe,felderArray[i][j].label);
    }
  }
}

void PvCOM_GameOver_Screen() {
  // code of PvCOM Game-Over Screen
}

void PvP_Screen() {
  background(backgroundC);

  backButton.drawButton(CENTER, 15, CENTER, backButton.x, backButton.y, 255);
}

void PvP_GameOver_Screen() {
  // code of PvP Game-Over Screen
}

/********* INPUTS *********/

public void mousePressed() {
  // if we are on the specified screen when clicked call this code
  switch(gameScreen) {
  case 0:
    if (PvCOM_Play.onButton()) {
      // change to Screen 1  
      gameScreen = 1;
    } else if (PvP_Play.onButton()) {
      // change to Screen 3  
      gameScreen = 3;
    }
    break;
    
  case 1:

    if (backButton.onButton()) {
      // change to Screen 0
      gameScreen = 0;
    }
    
    for (int i = 0; i < felderArray.length; i++) {
      for (int j = 0; j < felderArray[i].length; j++) {
      
        if (felderArray[i][j].onButton(feldBreite, feldHoehe)) {
          felderArray[i][j].rectColor = middlebluegreen;
        }
      }
    }

    break;

  case 2:
    //
  case 3:
      if (backButton.onButton()) {
        // change to Screen 0
        gameScreen = 0;
      }
    break;
    
  case 4:
    //
  }
}


/********* OTHER FUNCTIONS *********/
