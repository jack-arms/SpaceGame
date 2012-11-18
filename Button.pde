class Button {
  float buttonPosX;
  float buttonPosY;
  
  float buttonWidth;
  float buttonHeight;
  
  String buttonText;
  
  DynamicColor nonPressedColor;
  
  Button(float posX, float posY, float w, float h, DynamicColor nonPressedColor, String txt) {
    buttonPosX = posX;
    buttonPosY = posY;
    buttonWidth = w;
    buttonHeight = h;
    this.nonPressedColor = nonPressedColor;
    buttonText = txt;
  }
  
  boolean click() {
    return mouseX > buttonPosX && mouseX < buttonPosX + buttonWidth 
       && mouseY > buttonPosY && mouseY < buttonPosY + buttonHeight;
  } 
  
  void display() {
    rectMode(CORNER);
    fill(nonPressedColor.getRGB());
    stroke(255);
    rect(buttonPosX, buttonPosY, buttonWidth, buttonHeight);
    fill(255);
    text(buttonText, buttonPosX + 5, buttonPosY + buttonHeight/2 + 5);
  }
}
  
  
