public class MenueButton {
  float x=0, y=0, _width=0, _height=0;
  String label;
  color buttonColor;
  

  MenueButton(float x, float y, float _width, float _height, String label, color buttonColor) {
    this.x = x;
    this.y = y;
    this._width = _width;
    this._height = _height;
    this.label = label;
    this.buttonColor = buttonColor;
  }

  void drawButton(int drawFrom, int txtSize, int txtFrom, float textX, float textY, color textColor) {
    rectMode(drawFrom);
    fill(buttonColor);
    rect(x, y, _width, _height);
    textAlign(txtFrom, CENTER);
    textSize(txtSize);
    fill(textColor);
    text(label, textX, textY);
  }
}
