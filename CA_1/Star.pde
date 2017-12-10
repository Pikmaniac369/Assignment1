class Star
{
  //Coordinate variables/fields
  float StarX;
  float StarY;
  float StarZ;

  Star()
  {
    this.StarX = random(0, width);
    this.StarY = random(0, (height/8) * 6);
    this.StarZ = random(0, 100);
  }

  //If W or UP is pressed, move the stars towards the screen to simulate the ship moving forward
  void updateF()
  {
    StarZ = StarZ + 5;
  }
  
  //If S or DOWN is pressed, move the stars away from the screen to simulate the ship moving backwards
  void updateB()
  {
    StarZ = StarZ - 5;
  }
  
  //If A or LEFT is pressed, move the stars to the right to simulate the ship moving left
  void updateL()
  {
    StarX = StarX + 5;
  }
  
  //If D or RIGHT is pressed, move the stars to the left to simulate the sip moving right
  void updateR()
  {
    StarX = StarX - 5;
  }

  void render()
  {
    stroke(255);
    strokeWeight(2);
    point(StarX, StarY, StarZ);
  }
}