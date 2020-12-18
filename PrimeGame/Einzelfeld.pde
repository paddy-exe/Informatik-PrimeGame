class Einzelfeld {
  float posX=0, posY=0; 
  int index;
  String label;
  
  float feldBreite = width-2*width/8;
  float feldHoehe = height-2*height/6;
  
  Einzelfeld(float posX, float posY, int index, String label) {
    this.posX = posX;
    this.posY = posY;
    
    this.index = index;
    this.label = label;
  }
  
  boolean onButton() {
    return mouseX > posX && mouseX < (posX + feldBreite) && mouseY > posY && mouseY < (posY + feldHoehe);
  }
}
