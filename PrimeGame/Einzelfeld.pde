class Einzelfeld {
  float posX=0, posY=0; 
  int index;
  String label;
  
  Einzelfeld(float posX, float posY, int index, String label) {
    this.posX = posX;
    this.posY = posY;
    
    this.index = index;
    this.label = label;
  }
  
  void draw(float posX, float posY, float feldBreite, float feldHoehe, String label) {
    fill(255);
    rect(posX, posY, feldBreite, feldHoehe);
    fill(0);
    text(label, posX + feldBreite/2, posY + feldHoehe/2 + 5);
  }
  
  boolean onButton(float feldBreite, float feldHoehe) {
    return mouseX > posX && mouseX < (posX + feldBreite) && mouseY > posY && mouseY < (posY + feldHoehe);
  }
}
