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
  if(buttons.get(0).isClicked()) {
    float newSpeed = ((ButtonValueChanger)buttons.get(0)).click(bulletSpeed, 2.0, 1.0, 30.0);
    for(Bullet b : bullets) {
      b.speed = newSpeed;
    }
    bulletSpeed = newSpeed;
  }
  
  else if(buttons.get(1).isClicked()) {
    float newSpeed = ((ButtonValueChanger)buttons.get(1)).click(ship.speed, 2, 1, 50);
    ship.setSpeed(newSpeed);
  }
  
  else if(buttons.get(2).isClicked()) {
    ButtonToggle b = (ButtonToggle)buttons.get(2);
    b.click();
    bulletsDisappearOnImpact = b._pressed;
  }
}
