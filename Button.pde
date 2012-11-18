class Button {
  float buttonPosX;
  float buttonPosY;
  
  float buttonWidth;
  float buttonHeight;
  
  String buttonText;
  
  DynamicColor _nonPressedColor;
  
  Button(float posX, float posY, float w, float h, DynamicColor nonPressedColor, String txt) {
    buttonPosX = posX;
    buttonPosY = posY;
    buttonWidth = w;
    buttonHeight = h;
    this._nonPressedColor = nonPressedColor;
    buttonText = txt;
  }
  
  boolean isClicked() {
    return mouseX > buttonPosX && mouseX < buttonPosX + buttonWidth 
       && mouseY > buttonPosY && mouseY < buttonPosY + buttonHeight;
  } 
  
  void display(DynamicColor fillColor) {
    rectMode(CORNER);
    fill(fillColor.getRGB());
    stroke(255);
    rect(buttonPosX, buttonPosY, buttonWidth, buttonHeight);
    fill(255);
    text(buttonText, buttonPosX + 5, buttonPosY + buttonHeight/2 + 5);
  }
}
  
  
