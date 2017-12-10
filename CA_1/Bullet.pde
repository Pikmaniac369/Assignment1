class Bullet
{
  float BulletX1;
  float BulletX2;
  float BulletY1;
  float BulletY2;
  
  PVector VelocityFL;
  PVector VelocityFR;
  
  Bullet(float BulletX1, float BulletX2, float BulletY1, float BulletY2)
  {
    this.BulletX1 = BulletX1;
    this.BulletX2 = BulletX2;
    this.BulletY1 = BulletY1;
    this.BulletY2 = BulletY2;
    VelocityFL = new PVector( (width / 2) / 10, -( ( (height / 8) * 6.6) -(height / 2) ) );
    VelocityFR = new PVector(-( (width / 2) / 10), -( ( (height / 8) * 6.6) -(height / 2) ) );
  }
  
  void updateL()
  {
    BulletX1 = BulletX1 + VelocityFL.x;
    BulletY1 = BulletY1 + VelocityFL.y;
    BulletX2 = BulletX2 + VelocityFL.x;
    BulletY2 = BulletY2 + VelocityFL.y;
  }
  
  void updateR()
  {
    BulletX1 = BulletX1 + VelocityFR.x;
    BulletY1 = BulletY1 + VelocityFR.y;
    BulletX2 = BulletX2 + VelocityFR.x;
    BulletY2 = BulletY2 + VelocityFR.y;
  }
  
  void render()
  {
    line(BulletX1, BulletY1, BulletX2, BulletY2);
  }
}