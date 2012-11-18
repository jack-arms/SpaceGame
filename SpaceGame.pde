ArrayList <Bullet> bullets;
ArrayList <Asteroid> asteroids;
ArrayList <Button> buttons;

float bulletSpeed;
Ship ship;
int asteroidTime;
int timeBetweenAsteroids;
int maxTimeBetweenBullets;
int bulletTime;
int score;

float distanceToMove;
boolean keys[];

boolean okToShootBullet;

void setup() {
  size(1100,600);
  background(0);
  fill(255);
  rectMode(CORNERS);
  
  bullets = new ArrayList <Bullet>();
  asteroids = new ArrayList <Asteroid>();
  ship = new Ship(width/2, height/2);
  buttons = new ArrayList <Button>();
  setupButtons();
  
  bulletSpeed = 10;
  
  timeBetweenAsteroids = 200;
  maxTimeBetweenBullets = 10;
  score = 0;
  keys = new boolean[4];
}

void draw() {
  background(0);
  fill(255);
  text("Bullets: " + bullets.size(), 20, 20);
  text("Asteroids: " + asteroids.size(), width - 80, 20);
  text("Score: " + score, width/2 - 25, 20);
  text("Use WASD to move, and click to shoot", 20, height - 25);
  text("Click a button to increment a value, right/center click it to decrement.", 20, height - 12);
  
  ship.display(); 
  moveAsteroids();
  displayButtons();
  
  okToShootBullet = false;
  
  if(millis() > asteroidTime) {
    asteroidTime += timeBetweenAsteroids;
    addAsteroid();
  }
  
  if(millis() > bulletTime) {
    bulletTime += maxTimeBetweenBullets;
    okToShootBullet = true;
  }
  
  if(mousePressed && okToShootBullet && !buttonsArePressed()) {
    addBullet();
  }
  
  float[] movement = bufferKeys();
  ship.moveShip(movement[0] * ship.speed, movement[1] * ship.speed);
  
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

void displayButtons() {
  for(Button b : buttons) {
    b.display();
  }  
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
  asteroids.add(new Asteroid(x, y, (int)random(256), (int)random(256), (int)random(256), 255, "RGB")); 
}

void addBullet() {
  float angle = degrees(atan((mouseY - ship.gunY()) / (ship.gunX() - mouseX)));
  if(mouseX < ship.gunX()) {
    angle += 180;
  }
  bullets.add(ship.shootGun(angle, bulletSpeed));
}

void checkCollisions() {
  for(int i = 0; i < asteroids.size(); i++) {
    for(int j = 0; j < bullets.size(); j++) {
      if(asteroids.get(i).collided(bullets.get(j))) {
        asteroids.get(i).exploded = true;
        bullets.remove(j--);
        score++;
      }
    }
  }  
}

void setupButtons() {
  buttons.add(new ButtonStatic(width - 95, height - 50, 85, 40, new DynamicColor(200, 130, 0, 255, "RGB"), " Bullet speed"));
  buttons.add(new ButtonStatic(width - 185, height - 50, 85, 40, new DynamicColor(200, 130, 0, 255, "RGB"), "  Ship speed"));  
}

boolean buttonsArePressed() {
  for(Button b : buttons) {
    if(b.click()) {
      return true;
    }
  }
  return false;
}


