class Star
{
  //Coordinate variables/fields
  float StarX;
  float StarY;
  float StarZ;
  float PreviousZ;
  
  Star()
  {
    this.StarX = random(-width, width);
    this.StarY = random(-((height/8) * 6), (height/8) * 6);
    this.StarZ = random(width);
    PreviousZ = StarZ;
  }

  //If W or UP is pressed, move the stars towards the screen to simulate the ship moving forward
  void updateF()
  {
    StarZ = StarZ - 5;
    if(StarZ < 1)
    {
      StarX = random(-width, width);
      StarY = random(-((height/8) * 6), (height/8) * 6);
      StarZ = width;
    }
  }
  
  //If S or DOWN is pressed, move the stars away from the screen to simulate the ship moving backwards
  void updateB()
  {
    StarZ = StarZ + 5;
    if(StarZ > width)
    {
      StarX = random(-width, width);
      StarY = random(-((height/8) * 6), (height/8) * 6);
      StarZ = 1;
    }
  }
  
  //If A or LEFT is pressed, move the stars to the right to simulate the ship moving left
  void updateL()
  {
    StarX = StarX + 5;
    if(StarX > width)
    {
      StarX = -width;
      StarY = random(-((height/8) * 6), (height/8) * 6);
      StarZ = random(width);
    }
  }
  
  //If D or RIGHT is pressed, move the stars to the left to simulate the sip moving right
  void updateR()
  {
    StarX = StarX - 5;
    if(StarX < -width)
    {
      StarX = width;
      StarY = random(-((height/8) * 6), (height/8) * 6);
      StarZ = random(width);
    }
  }
  
  void warp_speed()
  {
    StarZ = StarZ - 50;
    if(StarZ < 1)
    {
      StarX = random(-width, width);
      StarY = random(-((height/8) * 6), (height/8) * 6);
      StarZ = width;
    }
    float StarX2 = map(StarX/StarZ, 0, 1, 0, width);
    float StarY2 = map(StarY/StarZ, 0, 1, 0, (height/8) * 6);
    float PreviousX = map(StarX/PreviousZ, 0, 1, 0, width);
    float PreviousY = map(StarY/PreviousZ, 0, 1, 0, (height/8) * 6); 
    
    PreviousZ = StarZ;
    
    stroke(255);
    line(PreviousX, PreviousY, StarX2, StarY2);
  }

  void render()
  {
    fill(255);
    noStroke();
    
    float StarX2 = map(StarX/StarZ, 0, 1, 0, width);
    float StarY2 = map(StarY/StarZ, 0, 1, 0, (height/8) * 6);
    
    float radius = map(StarZ, 0, width, 6, 0);
    
    ellipse(StarX2, StarY2, radius, radius);
    
  }
}