ArrayList <Bullet> bullets;
ArrayList <Asteroid> asteroids;
Direction direction;
Ship ship;
int asteroidTime;
int score;

void setup() {
  size(1200,500);
  background(0);
  fill(255);
  rectMode(CORNERS);
  
  bullets = new ArrayList <Bullet>();
  asteroids = new ArrayList <Asteroid>();
  ship = new Ship(width/2, height/2);
  
  asteroidTime = 1;
  score = 0;
  
  direction = Direction.ZERO;
}

void draw() {
  background(0);
  fill(255);
  text("Bullets: " + bullets.size(), 20, 20);
  text("Asteroids: " + asteroids.size(), width - 80, 20);
  text("Score: " + score, width/2 - 25, 20);
  text("Use WASD to move, and click to shoot", 20, height - 20);
  
  ship.display(); 
  moveAsteroids();
  
  if(millis() > asteroidTime) {
    asteroidTime += 1;
    addAsteroid();
  }
  
  if(keyPressed) {
    ship.moveShip(direction); 
  }
  
  moveBullets();
  checkCollisions();
  checkBulletsOOB();
  checkAsteroidsOOB();
}

void moveBullets() {
  for(Bullet b : bullets)
    b.moveBullet();
}

void moveAsteroids() {
  for(Asteroid a : asteroids)
    a.moveAsteroid();
}

void checkBulletsOOB() {
  for(int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    if(b.posX < 0 || b.posX > width || b.posY < 0 || b.posY > height) {
      bullets.remove(i--);
    }
  } 
}

void checkAsteroidsOOB() {
  for(int i = 0; i < asteroids.size(); i++) {
     Asteroid a = asteroids.get(i);
     if(a.xPos < -a.rad || a.xPos > width + a.rad || a.yPos < -a.rad || a.yPos > height + a.rad || a.exploded) {
       asteroids.remove(i--);
     } 
  }
}

void addAsteroid() {
  float x = random(50, width-50);
  float y = random(50, height-50);
  asteroids.add(new Asteroid(x, y, color(random(256), random(256), random(256)))); 
}

void checkCollisions() {
  for(int i = 0; i < asteroids.size(); i++) {
    for(int j = 0; j < bullets.size(); j++) {
      if(asteroids.get(i).collided(bullets.get(j))) {
        asteroids.get(i).exploded = true;
        //bullets.remove(j--);
        score++;
      }
    }
  }  
}

void keyPressed() {
  switch(key) {
    case 'A' : case 'a':
      direction = Direction.WEST;
      break;
    case 'W': case 'w':
      direction = Direction.NORTH;
      break;
    case 'D': case 'd':
      direction = Direction.EAST;
      break;
    case 'S': case 's':
      direction = Direction.SOUTH;
      break;  
  } 
}

void mouseDragged() {
  float angle = degrees(atan((mouseY - ship.gunY()) / (ship.gunX() - mouseX)));
  if(mouseX < ship.gunX()) {
    angle += 180;
  }
  bullets.add(ship.shootGun(angle));
}
