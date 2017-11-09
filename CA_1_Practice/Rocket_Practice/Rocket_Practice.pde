//Rocket object
PShape Rocket;
PShape RevRocket;
int j = 0;
int k = 0;

void setup()
{
  fullScreen();
}

//Button On/Off
boolean RKTbuttonOn = false;

void draw()
{
  background(0);
  drawRocketButton();
  
  for (j=0; j<9; j++)
  {
    drawRocket();
  }
  
  for (k=0; k<9; k++)
  {
    drawRevRocket();
  }
  
}

void drawRocket()
{
  shape(Rocket);
}

void drawRevRocket()
{
  shape(RevRocket);
}

void drawRocketButton()
{
  
}