class ButtonValueChanger extends Button {
  ButtonValueChanger(float posX, float posY, float w, float h, DynamicColor nonPressedColor, String txt) {
    super(posX, posY, w, h, nonPressedColor, txt);
  }  
    
  float click(float valueToChange, float increment, float lowerBound, float upperBound) {
    float newValue = valueToChange;
    if(super.isClicked()) {
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
