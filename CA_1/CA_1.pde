void setup()
{
  //Make the screen fullscreen
  fullScreen(P3D, 2);
  
  //Make the background black
  background(0);
  
  
}

//Boolean variable to tell whether the stars have already been drawn
boolean StarsDrawn = false;


//Create the Array of Star objects
Star[] stars = new Star[500];
//Create the button objects
Button DMButton = new Button((width/7)*6, (height/8)*7, 120, 50, "Defence Matrix");
Button RButton = new Button((width/7)*1, (height/8)*7, 120, 50, "Radar");
Button RKTButton = new Button((width/7)*2, (height/8)*7, 120, 50, "Rockets");
Button BButton = new Button((width/7)*5, (height/8)*7, 120, 50, "Boosters");

void draw()
{
  //If the stars haven't been drawn yet
  if(StarsDrawn == false)
  {
    //Draw the stars
    drawStars();
  }
  
  //Draw the control panel and buttons
  drawControlPanel();
  //If the buttons are On, draw the corressponding objects
}

void drawStars()
{
  for(int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
  
  for(int i = 0; i < stars.length; i++)
  {
    stars[i].render();
  }
  
  StarsDrawn = true;
}

//Draw the Control Panel that will contain the buttons
void drawControlPanel()
{
  DMButton.render();
  RButton.render();
  RKTButton.render();
  BButton.render();
}