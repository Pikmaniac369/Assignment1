class Star
{
  float StarX;
  float StarY;
  float StarZ;

  Star()
  {
    this.StarX = random(0, width);
    this.StarY = random(0, (height/8) * 6);
    this.StarZ = random(0, 100);
  }

  void updateF()
  {
    StarZ++;
  }

  void render()
  {
    stroke(255);
    strokeWeight(2);
    point(StarX, StarY, StarZ);
  }
}