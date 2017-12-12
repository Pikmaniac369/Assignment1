class Rocket
{
  PVector Position;
  PVector Velocity;
  
  Rocket(PVector Pos, PVector Vel)
  {
    Position = Pos.copy();
    Velocity = Vel.copy();
  }
  
  void update()
  {
    println(Position);
    while(Position.x != width/2)
    {
      Position = Position.add(Velocity);
      Velocity.limit(1);
      if(frameCount % (180000/18) == 0)
      {
        render();
      }
    }
    println(Position);
  }
  
}