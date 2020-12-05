// Informatik-Projektarbeit

// gameScreen variable kontrolliert welcher Screen dargestellt werden soll
// 0: Menue Screen
// 1: Game Screen gegen Computer
// 2: Game-Over Screen gegen Computer
// 3: Game Screen gegen Person
// 4: Game-Over Screen gegen Person

int gameScreen = 0;

/********* SETUP BLOCK *********/

void setup () {
  size(500, 500);
}

/********* DRAW BLOCK *********/
void draw () {
  switch(gameScreen) {
    case 0:
      menueScreen();
    case 1:
      PvCOM_Screen();
    case 2:
      PvCOM_GameOver_Screen();
    case 3:
      PvP_Screen();
    case 4:
      PvP_GameOver_Screen();
  }
}

/********* SCREEN CONTENTS *********/

void menueScreen() {
  // code of menue Screen
  
}

void PvCOM_Screen() {
  // code of PvCOM Screen 
}

void PvCOM_GameOver_Screen() {
  // code of PvCOM Game-Over Screen
}

void PvP_Screen() {
  // code of PvP Screen
}

void PvP_GameOver_Screen() {
  // code of PvP Game-Over Screen
}

/********* INPUTS *********/

public void mousePressed() {
  // if we are on the specified screen when clicked call this code
  switch(gameScreen) {
    case 0:
      //
    case 1:
      //
    case 2:
      //
    case 3:
      //
    case 4:
      //
  }
}

/********* OTHER FUNCTIONS *********/
