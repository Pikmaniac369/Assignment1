class Gun
{
  PVector startPos;
  PVector Velo;
  PVector Accel;
  
  Gun(float startPosX, float startPosY)
  {
    startPos = new PVector(startPosX, startPosY);
    
    Velo = new PVector(0, 0);
    Accel = new PVector(0, 0);
  }
  
  void update()
  {
     PVector retPos = new PVector(width/2, height/2);
     
     retPos.sub(startPos);
     
     retPos.setMag(1);
     
     Accel = retPos;
     
     Velo.add(Accel);
     startPos.add(Velo);
     Velo.limit(5);
    
  }
  
  void render()
  {
    noStroke();
    fill(#42E379);
    ellipse(startPos.x, startPos.y, 50, 10);
  }
}