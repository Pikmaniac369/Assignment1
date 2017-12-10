class Bullet
{
  /*float BulletX1;
  float BulletX2;
  float BulletY1;
  float BulletY2;*/
  float theta;
  float speed;
  PVector forward;
  
  PVector Position;
  //PVector VelocityFL;
  //PVector VelocityFR;
  
  Bullet(float BulletX, float BulletY, float theta, float speed)
  {
    this.theta = theta;
    this.speed = speed;
    forward = new PVector(0, -1);
    Position = new PVector(BulletX, BulletY);
    /*VelocityFL = new PVector( (width / 2) / 10, -( ( (height / 8) * 6.6) -(height / 2) ) );
    VelocityFR = new PVector(-( (width / 2) / 10), -( ( (height / 8) * 6.6) -(height / 2) ) );*/
  }
  
  void update()
  {
    println("BulletX Before: ", Position.x);
    println("BulletY Before: ", Position.y);
    //VelocityFL.limit(300);
    forward.x = sin(theta);
    forward.y = -cos(theta);
    Position.add(PVector.mult(forward, speed));
    
    if(Position.x < 0 || Position.x > width || Position.y < 0 || Position.y > height)
    {
      LeftBullets.remove(this);
    }
    println("BulletX After: ", Position.x);
    println("BulletY After: ", Position.y);
  }
  
  
  void render()
  {
    println("Am I being rendered?");
    pushMatrix();
    stroke(#42E379);
    rotate(theta);
    line(0, -5, 0, 5);
    popMatrix();
  }
}