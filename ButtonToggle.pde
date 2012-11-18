class ButtonToggle extends Button {
  boolean pressed;
  DynamicColor pressedColor;
  
  ButtonToggle(float posX, float posY, float w, float h, DynamicColor nonPressedColor, String txt) {
    super(posX, posY, w, h, nonPressedColor, txt);
    pressedColor = new DynamicColor(nonPressedColor._red, nonPressedColor._green, nonPressedColor._blue, nonPressedColor._alpha - 150, "RGB");
    pressed = false;
  }
  
  boolean click() {
    if(super.click()) {
      pressed = !pressed;
      return true;
    }
    else
      return false;
  }
  
  void display() {
    rectMode(CORNER);
    if(pressed) {
      fill(pressedColor.getRGB());
      rect(buttonPosX, buttonPosY, buttonWidth, buttonHeight);
      fill(255);
      text(buttonText, buttonPosX + 5, buttonPosY + buttonHeight/2 + 5);
    }
    else {
      super.display();
    }
  }
}
