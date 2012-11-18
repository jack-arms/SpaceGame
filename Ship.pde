class Ship {
  int xPos;
  int yPos;
  int partWidth;
  float speed;

  Ship(int x, int y) {
    xPos = x;
    yPos = y;
    partWidth = 10;
    speed = 20;
  }

  void display() {
    rectMode(CORNERS);
    noStroke();
    colorMode(RGB, 255);
    fill(255);
    rect(xPos, yPos, xPos + partWidth, yPos - 3 * partWidth);
    rect(xPos + partWidth, yPos - partWidth, xPos + 2 * partWidth, yPos - 4 * partWidth);
    rect(xPos + 2 * partWidth, yPos - 3 * partWidth, xPos + 4 * partWidth, yPos - 5 * partWidth);
    rect(xPos + 4 * partWidth, yPos - partWidth, xPos + 5 * partWidth, yPos - 4 * partWidth);
    rect(xPos + 5 * partWidth, yPos, xPos + 6 * partWidth, yPos - 3 * partWidth);
  }

  void moveShip(float moveX, float moveY) {
      xPos += moveX;
      yPos += moveY;
  }

  Bullet shootGun(float angle, float bulletSpeed) {
    colorMode(HSB);
    int h = floor(random(0,360));
    int s = floor(random(230,256));
    int b = floor(random(230,256));
    return new Bullet(xPos + 3 * partWidth, 
                      yPos - 5 * partWidth, 
                      angle, new DynamicColor(h, s, b, 255, "HSB"), bulletSpeed);
  }
  
  float gunX() { return xPos + 3 * partWidth; }
  float gunY() { return yPos - 5 * partWidth; }
  
  void setSpeed(float value) { speed = value; }
}
