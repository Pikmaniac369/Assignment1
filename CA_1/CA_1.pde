//PShape variables/fields
PShape Def_Matrix;
PShape Con_Pan;

void setup()
{
  //Make the screen fullscreen
  fullScreen(P3D, 1);

  //Create the Def_Matrix shape
  Def_Matrix = createShape();
  Def_Matrix.beginShape();
  //Set fill and stroke
  Def_Matrix.noFill();
  Def_Matrix.stroke(#42E379);//RGB(66, 227, 121) OR HSB(140, 70, 88)
  Def_Matrix.strokeWeight(2);
  //Draw shape
  //Def_Matrix.translate(width/2, height/2);
  Def_Matrix.vertex(0-(width/4), 0-(2*(height/6)));
  Def_Matrix.vertex(0+(width/4), 0-(2*(height/6)));
  Def_Matrix.vertex(0+(width/4)+50, 0-(height/4)+20);
  Def_Matrix.vertex(0+(width/8)+10, 0+(2*(height/6))-20);
  Def_Matrix.vertex(0-(width/8)-10, 0+(2*(height/6))-20);
  Def_Matrix.vertex(0-(width/4)-50, 0-(height/4)+20);
  Def_Matrix.vertex(0-(width/4), 0-(2*(height/6)));
  Def_Matrix.endShape(CLOSE);
  //Finish creating the Def_Matrix shape
  
  //Create the Con_Pan shape
  Con_Pan = createShape();
  Con_Pan.beginShape();
  //Set fill and stroke
  Con_Pan.fill(255, 0, 0, 255);
  Con_Pan.stroke(255, 0, 0, 255);
  Con_Pan.strokeWeight(2);
  //Draw the Control Panel
  Con_Pan.vertex(0, (height/8)*6.6 );
  Con_Pan.vertex( (width/5) * 1, (height/8) * 6.6);
  Con_Pan.vertex( (width/5) * 4, (height/8) * 6.6);
  Con_Pan.vertex(width, (height/8) * 6.6);
  Con_Pan.vertex(width, height);
  Con_Pan.vertex(0, height);
  Con_Pan.vertex(0, (height/8)*6.6 );
  Con_Pan.endShape(CLOSE);

  //Initialise the button objects
  DMButton = new Button((width/7)*6, (height/8)*7, 120, 50, "Defence Matrix");
  RButton = new Button((width/7)*1, (height/8)*7, 120, 50, "Radar");
  RKTButton = new Button((width/7)*2, (height/8)*7, 120, 50, "Rockets");
  BButton = new Button((width/7)*5, (height/8)*7, 120, 50, "Boosters");

  //Initialise the Radar object
  TLRadar = new Radar(width/8f, (height/9f) * 1.5, 75f, 0.35f, 255f, 155f, 0f, 255f);
  //Initialise the Reticle object
  Ret = new Reticle(color(255, 155, 0), width/2, height/2, 25f);
}







//Boolean variable to tell whether the stars have already been drawn
boolean StarsDrawn = false;

//Create the Array of Star objects
Star[] stars = new Star[1000];

//Create the button objects
Button DMButton;
Button RButton;
Button RKTButton;
Button BButton;

//Create the Defence Matrix object
Defence_Matrix DM = new Defence_Matrix(Def_Matrix);
//Create the Radar object
Radar TLRadar;
//Create the Reticle object
Reticle Ret;

//----------------------------------->USE AN ARRAY TO HOLD BULLET OBJECTS<-----------------------------------
ArrayList<Bullet> LeftBullets = new ArrayList<Bullet>(9);
ArrayList<Bullet> RightBullets = new ArrayList<Bullet>(9);










void draw()
{

  //Make the background black
  background(0);

  //If the stars haven't been drawn yet
  if (StarsDrawn == false)
  {
    makeStars();
  }

  //Draw the stars
  drawStars();

  //Draw the control panel and buttons
  drawControlPanel();
  
  //--------------->If the buttons are On, draw the corressponding objects<-------------------
  //If the Defence Matrix button is on, draw the Defence Matrix
  if (DMButton.ButtonOn == true)
  {
    DM.render();
  }
  
  //If the Booster button is on, draw the warp_speed effect
  if(BButton.ButtonOn == true)
  {
    pushMatrix();
    translate(width/2, height/2);
    for(Star s:stars)
    {
      s.warp_speed();
    }
    popMatrix();
  }
  
  //If the Rocket button is on, drawe and fire the bullets
  if(RKTButton.ButtonOn == true)
  {
    if(frameCount % 30 == 0)
    {
      Shoot();
    }
  }
  
  //If the Radar button is on, draw the Radar
  if (RButton.ButtonOn == true)
  {
    TLRadar.render();
    TLRadar.update();
  }
  
  //--------------->If WASD or UP, DOWN, LEFT or RIGHT are pressed, move the stars to simulate the ship moving<-------------------
  //If W or UP is pressed, move the stars towards the screen to simulate the ship moving forward
  if(keyPressed == true && (key == 'w' || key == 'W' || keyCode == UP))
  {
   
    for(int i = 0; i < stars.length; i++)
    {
      stars[i].updateF();
    }
    
  }
  
  //If S or DOWN is pressed, move the stars away from the screen to simulate the ship moving backwards
  if(keyPressed == true && (key == 's' || key == 'S' || keyCode == DOWN))
  {
   
    for(int i = 0; i < stars.length; i++)
    {
      stars[i].updateB();
    }
    
  }
  
  //If A or LEFT is pressed, move the stars to the right to simulate the ship moving left
  if(keyPressed == true && (key == 'a' || key == 'A' || keyCode == LEFT))
  {
   
    for(int i = 0; i < stars.length; i++)
    {
      stars[i].updateL();
    }
    
  }
  
  //If D or RIGHT is pressed, move the stars to the left to simulate the sip moving right
  if(keyPressed == true && (key == 'd' || key == 'D' || keyCode == RIGHT))
  {
   
    for(int i = 0; i < stars.length; i++)
    {
      stars[i].updateR();
    }
    
  }
  
  
}













//Function to display the stars to the screen
void drawStars()
{
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < stars.length; i++)
  {
    stars[i].render();
  }
  popMatrix();
}


//Function to make Star objects and insert them into an array
void makeStars()
{
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }

  StarsDrawn = true;
}




//Draw the Control Panel that will contain the buttons
void drawControlPanel()
{
  shape(Con_Pan);
  DMButton.render();
  RButton.render();
  RKTButton.render();
  BButton.render();
  Ret.render();
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


//Change the state of the buttons when they are clicked
void mouseClicked()
{
  if ( (mouseX < (DMButton.ButtonX + (DMButton.ButtonW / 2) ) ) && (mouseX > DMButton.ButtonX - (DMButton.ButtonW / 2) ) && (mouseY > (DMButton.ButtonY - (DMButton.ButtonH / 2)) ) && (mouseY < (DMButton.ButtonY + (DMButton.ButtonH / 2) ) ) )//USE VOID UPDATE FOR EACH OBJECT THEN GO BACK TO DRAW
  {
    DMButton.update();
  } else if ( (mouseX < (RButton.ButtonX + (RButton.ButtonW / 2) ) ) && (mouseX > RButton.ButtonX - (RButton.ButtonW / 2) ) && (mouseY > (RButton.ButtonY - (RButton.ButtonH / 2)) ) && (mouseY < (RButton.ButtonY + (RButton.ButtonH / 2) ) ) )//USE VOID UPDATE FOR EACH OBJECT THEN GO BACK TO DRAW
  {
    RButton.update();
  } else if ( (mouseX < (RKTButton.ButtonX + (RKTButton.ButtonW / 2) ) ) && (mouseX > RKTButton.ButtonX - (RKTButton.ButtonW / 2) ) && (mouseY > (RKTButton.ButtonY - (RKTButton.ButtonH / 2)) ) && (mouseY < (RKTButton.ButtonY + (RKTButton.ButtonH / 2) ) ) )//USE VOID UPDATE FOR EACH OBJECT THEN GO BACK TO DRAW
  {
    RKTButton.update();
  } else if ( (mouseX < (BButton.ButtonX + (BButton.ButtonW / 2) ) ) && (mouseX > BButton.ButtonX - (BButton.ButtonW / 2) ) && (mouseY > (BButton.ButtonY - (BButton.ButtonH / 2)) ) && (mouseY < (BButton.ButtonY + (BButton.ButtonH / 2) ) ) )//USE VOID UPDATE FOR EACH OBJECT THEN GO BACK TO DRAW
  {
    BButton.update();
  } else
  {
  }
}