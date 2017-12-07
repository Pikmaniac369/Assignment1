void setup()
{
  fullScreen(P3D);
}

//Button On/Off
boolean RKTbuttonOn = true;

void draw()
{
  background(0);
  drawRocketButton();
  
  if (RKTbuttonOn == true)
  {
    for (j=0; j<9; j++)
    {
      drawRocket();
    }

    for (k=0; k<9; k++)
    {
      drawRevRocket();
    }
  }
}

void drawRocket()
{

}

void drawRevRocket()
{
}

void drawRocketButton()
{
  //Button position variables
  float RKTbuttonX = (width/7)*2;
  float RKTbuttonY = (height/8)*7;
  float RKTbuttonW = 120;
  float RKTbuttonH = 50;
  //Button Label variable
  String RKTbuttonLabel = "Rockets";
  
  if (RKTbuttonOn == false)
  {
    //Make the button off-white if off
    stroke(255);
    fill(#D3D1D1);
  }
  else if (RKTbuttonOn == true)
  {
    //Make the button pale-orange if on
    stroke(255);
    fill(#FF9829);
  }

  //Draw the button
  rectMode(CENTER);
  rect(RKTbuttonX, RKTbuttonY, RKTbuttonW, RKTbuttonH);

  //Write the button label
  fill(0);
  textSize(16.5);
  textAlign(CENTER, CENTER);
  text(RKTbuttonLabel, RKTbuttonX, RKTbuttonY, RKTbuttonW, RKTbuttonH);
}