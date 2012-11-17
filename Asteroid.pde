class Asteroid {
  float xPos;
  float yPos;
  color c;
  float angle;
  float speed;
  float rad;
  boolean exploded;
  
  Asteroid(float xPos, float yPos, color c) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.c = c;
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
    fill(c);
    ellipse(xPos, yPos, rad, rad);
  }
  
  boolean collided(Bullet b) {
    return dist(xPos, yPos, b.posX, b.posY) < rad;
  }
}

