class Rocket
{
  float Rx;
  float Ry;
  float Rz;
  
  Rocket(float Rx, float Ry, float Rz)
  {
    this.Rx = Rx;
    this.Ry = Ry;
    this.Rz = Rz;
  }
  
  void update()
  {
    if(Rx<width/2)
    {
      Rx++;
    }
    else if(Rx>width/2)
    {
      Rx--;
    }
    Ry--;
    Rz--;
  }
  
  void render()
  {
    
  }
}