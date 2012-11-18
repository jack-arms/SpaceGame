class ButtonStatic extends Button {
  ButtonStatic(float posX, float posY, float w, float h, DynamicColor nonPressedColor, String txt) {
    super(posX, posY, w, h, nonPressedColor, txt);
  }  
  
  /*boolean click(int valueToChange) {
    int newValue = valueToChange;
    if(super.click()) {
      if(mouseButton == LEFT) {
        newValue += 1;
      } else if(mouseButton == RIGHT) {
        newValue -= 1;
      }
    }
    return newValue;
  }
  
  boolean click(super.click());*/
}
