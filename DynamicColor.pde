/**
 * @class DynamicColor
 * Created from my frustration with color variables -- this class allows setting of individual
 * color components, but there are methods for creating color variables for fill(), stroke(), and such.
 */
class DynamicColor {
  
  // INSTANCE VARIABLES
  
  // Color components
  int _red;
  int _green;
  int _blue;
  int _alpha;
  int _hue;
  int _saturation;
  int _brightness;
  String _colorMode;
  
  // CONSTRUCTORS
  
  DynamicColor(int component1, int component2, int component3, int alphaComponent, String mode) {
    if(mode.equals("RGB")) {
      _red = component1;
      _green = component2;
      _blue = component3;
    }
    else if(mode.equals("HSB")) {
      _hue = component1;
      _saturation = component2;
      _brightness = component3;
    }
    else {
      throw new IllegalArgumentException("Mode did not match \"HSB\" or \"RGB\".");
    }
    _alpha = alphaComponent;
    _colorMode = mode;
  }
  
  // Not really necessary, but this is a default constructor
  DynamicColor() {}
  
  // METHODS
  
  // The setters are pretty self-explanatory, will maybe add documentation later
  
  // Individual component setters
  void setRed(int r) { _red = r; }
  void setGreen(int g) { _green = g; }   
  void setBlue(int b) { _blue = b; }
  void setAlpha(int a) { _alpha = a; }
  void setHue(int h) { _hue = h; }
  void setSaturation(int s) { _saturation = s; }
  void setBrightness(int b) { _brightness = b; }
  
  // Group component setters
  void setRGB(int r, int g, int b, int a) {
    _red = r;
    _green = g;
    _blue = b;
    _alpha = a;
  }
  void setHSB(int h, int s, int b, int a) {
    _hue = h;
    _saturation = s;
    _brightness = b;
    _alpha = a;
  }
  
  /**
   * Creates an RGB color variable using _red, _green, _blue, and _alpha
   * @return - An RGB color variable, with alpha
   */
  color getRGB() {
    colorMode(RGB);
    return color(_red, _green, _blue, _alpha);
  }
  
  /**
   * Creates an HSB color variable using _hue, _saturation, _brightness, and _alpha
   * @return - An HSB color variable, with alpha
   */
  color getHSB() {
    colorMode(HSB);
    return color(_hue, _saturation, _brightness, _alpha);
  }
}
