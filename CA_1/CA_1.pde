void setup()
{
  //Make the screen fullscreen
  fullScreen(P3D, 2);
}

//Create the button objects
Button DMButton = new Button((width/7)*6, (height/8)*7, 120, 50, "Defence Matrix");
Button RButton = new Button((width/7)*1, (height/8)*7, 120, 50, "Radar");
Button RKTButton = new Button((width/7)*2, (height/8)*7, 120, 50, "Rockets");
Button BButton = new Button((width/7)*5, (height/8)*7, 120, 50, "Boosters");

void draw()
{
  //Make the background black
  background(0);
  
  drawControlPanel();
  //If the buttons are On, draw the corressponding objects
}

//Draw the Control Panel that will contain the buttons
void drawControlPanel()
{
  DMButton.render();
  RButton.render();
  RKTButton.render();
  BButton.render();
}