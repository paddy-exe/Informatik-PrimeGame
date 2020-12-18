// Informatik-Projektarbeit

// gameScreen variable kontrolliert welcher Screen dargestellt werden soll
// 0: Menue Screen
// 1: Game Screen gegen Computer
// 2: Game-Over Screen gegen Computer
// 3: Game Screen gegen Person
// 4: Game-Over Screen gegen Person

int gameScreen = 0;

// color variables
color backgroundC = #EDF6F9;
color middlebluegreen = #83C5BE;
color ming = #006D77;
color unbleachedsilk = #FFDDD2;
color darksalmon = #E29578;

// button variables
MenueButton PvCOM_Play, PvP_Play, backButton;

/********* SETUP BLOCK *********/

void setup () {
  size(500, 500);
  //fullScreen();

  // window standard settings
  textAlign(CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  PvCOM_Play = new MenueButton(width/2, height*0.4, width/2, height * 0.15, "Player versus COM", middlebluegreen);
  PvP_Play = new MenueButton(width/2, height*0.6, width/2, height * 0.15, "Player versus Player", darksalmon);

  rectMode(CORNER);
  backButton = new MenueButton(0, 0, width*0.15, height*0.05, "Back", ming);
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
  
  backButton.drawButton(CORNER,15,CENTER, backButton._width/2, backButton._height/2, 255);
  
}

void PvCOM_GameOver_Screen() {
  // code of PvCOM Game-Over Screen
}

void PvP_Screen() {
  background(backgroundC);
  
  backButton.drawButton(CORNER,15,CENTER, backButton._width/2, backButton._height/2, 255);
}

void PvP_GameOver_Screen() {
  // code of PvP Game-Over Screen
}

/********* INPUTS *********/

public void mousePressed() {
  // if we are on the specified screen when clicked call this code
  switch(gameScreen) {
    case 0:
      if (onPvCOMButton()) {
        // change to Screen 1  
        gameScreen = 1;    
      } else if (onPvPButton()) {
        // change to Screen 3  
        gameScreen = 3;       
      }
      break;
    case 1:

      if (onBackButton()) {
        // change to Screen 0
        gameScreen = 0;
      }
      
      break;
      
    case 2:
      //
    case 3:
      if (gameScreen == 3) {
        if (onBackButton()) {
          // change to Screen 0
          gameScreen = 0;
        }
      }
      break;
    case 4:
      //
  }
}


/********* OTHER FUNCTIONS *********/

boolean onPvCOMButton () {
  return mouseX > (PvCOM_Play.x-PvCOM_Play._width/2) && mouseX < (PvCOM_Play.x+PvCOM_Play._width/2)
        && mouseY > (PvCOM_Play.y-PvCOM_Play._height/2) && mouseY < (PvCOM_Play.y+PvCOM_Play._height/2);
}

boolean onPvPButton () {
  return mouseX > (PvP_Play.x-PvP_Play._width/2) && mouseX < (PvP_Play.x+PvP_Play._width/2)
        && mouseY > (PvP_Play.y-PvP_Play._height/2) && mouseY < (PvP_Play.y+PvP_Play._height/2);
}


boolean onBackButton () {
  return mouseX < (backButton.x+backButton._width) && mouseY < (backButton.y+backButton._height); 
}
