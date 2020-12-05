// Informatik-Projektarbeit

// gameScreen variable kontrolliert welcher Screen dargestellt werden soll
// 0: Menue Screen
// 1: Game Screen gegen Computer
// 2: Game-Over Screen gegen Computer
// 3: Game Screen gegen Person
// 4: Game-Over Screen gegen Person

int gameScreen = 0;

// color variables
color backgroundC = #F5E95B;
color hellblau = #59F0E6;
color lila = #8D65F0;
color orange = #F07435;
color yellow = #F5E95B;

// button variables
MenueButton PvCOM_Play, PvP_Play;
float buttonWidth;
float button1PosY;
float button2PosY;

/********* SETUP BLOCK *********/

void setup () {
  size(500, 500);
  //fullScreen();
  
  // window standard settings
  background(backgroundC);
  textAlign(CENTER);
  rectMode(CENTER);
  
  PvCOM_Play = new MenueButton(width/2, height*0.4, width/2, height * 0.15, "Player versus COM", orange);
  PvP_Play = new MenueButton(width/2, height*0.6, width/2, height * 0.15, "Player versus Player", orange);
  
  buttonWidth = width / 2;
  button1PosY = height * 0.4;
  button2PosY = height * 0.6;
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
  textSize(60);
  fill(0);
  text("Prime Game", width/2, height * 0.2);
  
  PvCOM_Play.drawButton();
  PvP_Play.drawButton();
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
