class ThingToShoot {
  int posX;
  int posY;
  int thingWidth;
  int thingHeight;
  int moveXMax = (int)random(-3,3);
  int moveXMin = (int)random(-4,3);
  PImage img;

  color col = (int)random(70, 255);
  boolean dead = false;

  ThingToShoot(int x, int sizeX, int y, int sizeY, PImage img) {
    this.posX = x;
    this.posY = y;
    this.thingWidth = sizeX;
    this.thingHeight = sizeY;
    this.img = img;
  }

  void drawThing(color c) {
    fill(c);
    if (img != null)
      image(img, posX, posY);
    else
      rect(posX, posY, thingWidth, thingHeight);
  }

  void move() { 
    posX += random(moveXMin, moveXMax);
    posY += random(-1, 3);
    
    if (posY > height)
      posY = -thingHeight;
    if (posX > width)
      posX = 20;
    if (posX < 0)
      posX = width-20;
  }
}