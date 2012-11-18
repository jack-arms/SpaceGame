class ButtonToggle extends Button {
  boolean _pressed;
  DynamicColor _pressedColor;
  
  ButtonToggle(float posX, float posY, float w, float h, DynamicColor nonPressedColor, String txt) {
    super(posX, posY, w, h, nonPressedColor, txt);
    _pressedColor = new DynamicColor(nonPressedColor._red, nonPressedColor._green, nonPressedColor._blue, nonPressedColor._alpha - 150, "RGB");
    _pressed = false;
  }
  
  void click() {
    if(super.isClicked()) {
      _pressed = !_pressed;
    }
  }
  
  void display() {
    rectMode(CORNER);
    if(_pressed) {
      super.display(_pressedColor);
    }
    else {
      super.display(_nonPressedColor);
    }
  }
}
