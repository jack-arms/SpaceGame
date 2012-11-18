class ButtonValueChanger extends Button {
  ButtonValueChanger(float posX, float posY, float w, float h, DynamicColor nonPressedColor, String txt) {
    super(posX, posY, w, h, nonPressedColor, txt);
  }  
    
  float clickAction(float valueToChange, float increment, float lowerBound, float upperBound) {
    float newValue = valueToChange;
    if(super.click()) {
      if(mouseButton == LEFT) {
        newValue += increment;
      }
      else {
        newValue -= increment;
      }
    }
    return constrain(newValue, lowerBound, upperBound);
  }
}
