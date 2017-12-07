class Star
{
  float StarX;
  float StarY;
  
  Star()
  {
    this.StarX = random(0, width);
    this.StarY = random(0, height);
  }
  
  void update()
  {
    
  }
  
  void render()
  {
    stroke(255);
    strokeWeight(2);
    point(StarX, StarY);
  }
}