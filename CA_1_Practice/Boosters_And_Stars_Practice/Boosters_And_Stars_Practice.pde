void setup()
{
  fullScreen();
  background(0);
}

boolean starsDrawn = false;
boolean BbuttonOn = false;

void draw()
{
  drawBoosterButton();
  
  if (starsDrawn == false)
  {
    for (float l=0; l<random(350, 500); l++)
    {
      drawStars();
    }
  }
}

void drawStars()
{
  stroke(255);
  fill(255);
  float starX = random(0, width);
  float starY = random(0, height);
  point(starX, starY);
  starsDrawn = true;
}

void drawBoosterButton()
{
   //Button position variables
  float BbuttonX = (width/7)*5;
  float BbuttonY = (height/8)*7;
  float BbuttonW = 120;
  float BbuttonH = 50;
  //Button Label variable
  String BbuttonLabel = "Boosters";
  
  if (BbuttonOn == false)
  {
    //Make the button off-white if off
    stroke(255);
    fill(#D3D1D1);
  }
  else if (BbuttonOn == true)
  {
    //Make the button pale-orange if on
    stroke(255);
    fill(#FF9829);
  }

  //Draw the button
  rectMode(CENTER);
  rect(BbuttonX, BbuttonY, BbuttonW, BbuttonH);

  //Write the button label
  fill(0);
  textSize(16.5);
  textAlign(CENTER, CENTER);
  text(BbuttonLabel, BbuttonX, BbuttonY, BbuttonW, BbuttonH);
}