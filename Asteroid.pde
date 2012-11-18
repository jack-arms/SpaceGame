class Asteroid {
  float xPos;
  float yPos;
  DynamicColor asteroidColor;
  float angle;
  float speed;
  float rad;
  boolean exploded;
  
  Asteroid(float xPos, float yPos, int component1, int component2, int component3, int alphaComponent, String mode) {
    this.xPos = xPos;
    this.yPos = yPos;
    asteroidColor = new DynamicColor(component1, component2, component3, alphaComponent, mode);
    angle = random(0, TWO_PI);
    speed = random(1) + 1;
    rad = 40;
    exploded = false;
  }
  
  void moveAsteroid() {
    if(!exploded) {
      display();
      xPos += cos(angle) * speed;
      yPos -= sin(angle) * speed;
    }
  }
  
  void display() {
    fill(asteroidColor.getRGB());
    ellipse(xPos, yPos, rad, rad);
  }
  
  boolean collided(Bullet b) {
    return dist(xPos, yPos, b.posX, b.posY) < rad;
  }
}
