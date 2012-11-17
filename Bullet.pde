class Bullet {
  float posX;
  float posY;
  float speed;
  float angle;
  float len;
  color bulletColor;
  
  Bullet(float posX, float posY, float angle, int h, int s, int b) {
    this.posX = posX;
    this.posY = posY;
    this.angle = radians(angle);
    colorMode(HSB, 360, 255, 255);
    bulletColor = color(h, s, b);
    len = 5;
    speed = 10;
  }
  
  void moveBullet() {
    displayBullet();
    posX += cos(angle) * speed;
    posY -= sin(angle) * speed;
  }
  
  void displayBullet() {
    stroke(bulletColor);
    strokeWeight(2);
    line(posX, posY, posX + cos(angle) * len, posY - sin(angle) * len);
  }
}

