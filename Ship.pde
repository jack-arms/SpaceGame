class Ship {
  int xPos;
  int yPos;
  int partWidth;

  Ship(int x, int y)
  {
    xPos = x;
    yPos = y;
    partWidth = 10;
  }

  void display()
  {
    noStroke();
    colorMode(RGB, 255);
    fill(255);
    rect(xPos, yPos, xPos + partWidth, yPos - 3 * partWidth);
    rect(xPos + partWidth, yPos - partWidth, xPos + 2 * partWidth, yPos - 4 * partWidth);
    rect(xPos + 2 * partWidth, yPos - 3 * partWidth, xPos + 4 * partWidth, yPos - 5 * partWidth);
    rect(xPos + 4 * partWidth, yPos - partWidth, xPos + 5 * partWidth, yPos - 4 * partWidth);
    rect(xPos + 5 * partWidth, yPos, xPos + 6 * partWidth, yPos - 3 * partWidth);
  }

  void moveShip(Direction direction)
  {
      float movement = partWidth/4;
      switch(direction)
      {
        case EAST:
          xPos += movement;
          break;
        case NORTH:
          yPos -= movement;
          break;
        case WEST:
          xPos -= movement;
          break;  
        case SOUTH:
          yPos += movement;
      }
  }

  Bullet shootGun(float angle)
  {
    colorMode(HSB);
    int h = floor(random(0,360));
    int s = floor(random(230,256));
    int b = floor(random(230,256));
    return new Bullet(xPos + 3 * partWidth, 
                      yPos - 5 * partWidth, 
                      angle,
                      h, s, b);
  }
  
  float gunX() { return xPos + 3 * partWidth; }
  float gunY() { return yPos - 5 * partWidth; }
}
