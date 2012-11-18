void keyPressed() {
  switch(key) {
    case 'w':
      keys[0] = true;
      break;
    case 'a':
      keys[1] = true;
      break;
    case 's':
      keys[2] = true;
      break;
    case 'd':
      keys[3] = true;
      break;
  }  
}

void keyReleased() {
  switch(key) {
    case 'w':
      keys[0] = false;
      break;
    case 'a':
      keys[1] = false;
      break;
    case 's':
      keys[2] = false;
      break;
    case 'd':
      keys[3] = false;
      break;
  }  
}

float[]  bufferKeys() {
  float moveX = 0;
  float moveY = 0;
  
  if(keys[0]) {
    moveY -= 1;
  }
  if(keys[1]) {
    moveX -= 1;
  }
  if(keys[2]) {
    moveY += 1;
  }
  if(keys[3]) {
    moveX += 1;
  }
  
  return new float[] {moveX, moveY};
}

void mousePressed() {
  if(buttons.get(0).click()) {
    float change = mouseButton == LEFT ? 1 : -1;
    for(Bullet b : bullets) {
      b.speed += change;
      b.speed = constrain(b.speed, 1, 30);
    }
    bulletSpeed += change;
    bulletSpeed = constrain(bulletSpeed, 1, 30);
  }
  
  else if(buttons.get(1).click()) {
    float change = mouseButton == LEFT ? 1 : -1;
    ship.changeSpeed(change);
    ship.speed = constrain(ship.speed, 1, 50); 
  }
}
