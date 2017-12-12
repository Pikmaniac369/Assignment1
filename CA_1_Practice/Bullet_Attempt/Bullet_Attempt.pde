//----------------------------------->USE AN ARRAY TO HOLD BULLET OBJECTS<-----------------------------------
ArrayList<Bullet> LeftBullets = new ArrayList<Bullet>(9);
ArrayList<Bullet> RightBullets = new ArrayList<Bullet>(9);

void draw()
{
  //If the Rocket button is on, drawe and fire the bullets
  if(RKTButton.ButtonOn == true)
  {
    if(frameCount % 30 == 0)
    {
      Shoot();
    }
  }
}

//Shoot the bullets
void Shoot()
{
  //Make the bullets
  makeBullets();
  
  //Fire the bullets
  fire();
}


//Function to make the bullets
void makeBullets()
{
  for (int i = 0; i < 9; i++)
  {
    LeftBullets.add(new Bullet(1f, (height/8) * 6.6, 35, 5));
  }
  
  for (int i = 0; i < 9; i++)
  {
    RightBullets.add(new Bullet(width-1, (height/8) * 6.6, -125, 5));
  }
}

//Function to fire the bullets
void fire()
{
  for(int i = 0; i < LeftBullets.size(); i++)
  {
    Bullet LB = LeftBullets.get(i);
    LB.render();
    while( (LB.Position.x < width/2) && (LB.Position.y < height/2) )
    {
      LB.update();
    }
    
    Bullet RB = RightBullets.get(i);
    RB.render();
    while((RB.Position.x < width/2) && (RB.Position.y < height/2))
    {
      RB.update();
    }
  
  }
  
 // RKTButton.update();
}