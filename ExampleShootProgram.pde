boolean wasPressed = false;
boolean printedThisFrame = false;
ArrayList<ThingToShoot> things;
PImage bg;
ArrayList<PImage> images;
int timer = 0;
int points = 0;

void setupShooter() { // Runs once
  bg = loadImage("bg.jpg");
  background(bg);
  things = new ArrayList();
  images = new ArrayList();
  images.add(loadImage("images/testImage.png"));
  images.add(loadImage("images/testImage1.png"));
  //images.add(loadImage("images/testImage2.png"));

  //Add some random things to shoot
  for (int i = 0; i < 15; i++) {
    // Image arraylist get stored image and stores it inside a new variable called img
    PImage img = images.get((int)random(0, images.size()));
    // Create the image to plot on screen
    things.add(new ThingToShoot((int)random(0, width), img.width, (int)random(0, height), img.height, img));
  }
}

// Function
void shooterDrawLoop() {
  // Draws the beautiful landscape background
  background(bg);

  /* -------------- Shoot things -------------- */
  // User hasen't pulled bow string back yet.
  if (val == 0) //Button not pressed
  { 
    // User has pulled string back and released
    if (wasPressed) 
    { //it "shoots" when you stop pressing
      println("Shooting at", "x:"+mouseX, "y:"+mouseY, "after holding for", millis()-timer, "milliseconds");
      shoot();
    }
    wasPressed = false; //Set to not pressed
  } else 
  { //If the button is pressed
    // starts a timer for when you release the bow till' it runs the wasPressed if statement.
    if (!wasPressed) timer = millis(); //Time when the button was pressed (millis() returns the time since the program started in milliseconds. Divide by 1000 for seconds)
    wasPressed = true; //Set to pressed
  }

  /* -------------- Draw Things -------------- */
  // Moves each individual and draws the objects.
  for (int i = 0; i<things.size(); i++) {
    ThingToShoot t = things.get(i);
    t.move();
    t.drawThing(t.col);
  }

  /* -------------- End -------------- */
  if (things.size() == 0) { //You win
    background(25);
    textSize(40);
    fill(60);
    text("Everyone has an arrow in their head.", 50, 150);
    fill(90);
    text("Good job!", 40, 100);
    textSize(30);
    text("You earned "+points +" points in "+ millis()/1000+ " seconds.", 60, 190);
    text("Score: "+ (int)(points/(millis()/1000.0)*100)+ " (points/time)*100", 60, 230);
    noLoop();
  }
}

/* -------------- Where the shooting happens -------------- */
// Function for when the object gets hit within the position paramenteres for the individual object, it removes them from the arraylist and
// kills the object.
void shoot() {
  boolean hit = false;
  int count = 0;
  for (int i = 0; i<things.size(); i++) //For all "things"
  {
    ThingToShoot t = things.get(i);
    if (checkMouseInside(t.posX, t.posX+t.thingWidth, t.posY, t.posY+t.thingHeight)) 
    {
      count++;
      hit = true;
      println("Hit your rectangular head number "+i+"!");

      //Remove this thing
      things.remove(i);
    }
  }

  //Keep track of points
  int newPoints = count > 1 ? count*2 : count;
  points += count > 1 ? count*2 : count; //A bit fancy, google "one line if else java"
  if (!hit)
    println("... Thats a miss");
  else 
    println("+"+newPoints+" points. You now have", points,".");
  println("***********************************");
}


/* -------------- Checks if the mouse is within a rectangle -------------- */
boolean checkMouseInside(int xStart, int xEnd, int yStart, int yEnd) {
  if (mouseX > xStart && mouseX < xEnd && mouseY > yStart && mouseY < yEnd ) 
    return true;
  else
    return false;
}