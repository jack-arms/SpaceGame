class Bullet {
  float posX;
  float posY;
  float speed;
  float angle;
  float len;
  DynamicColor bulletColor;
  
  Bullet(float posX, float posY, float angle, DynamicColor bulletColor, float speed) {
    this.posX = posX;
    this.posY = posY;
    this.angle = radians(angle);
    this.bulletColor = bulletColor;
    len = 5;
    this.speed = speed;
  }
  
  void moveBullet() {
    displayBullet();
    posX += cos(angle) * speed;
    posY -= sin(angle) * speed;
  }
  
  void displayBullet() {
    stroke(bulletColor.getHSB());
    strokeWeight(2);
    line(posX, posY, posX + cos(angle) * len, posY - sin(angle) * len);
  }
}

