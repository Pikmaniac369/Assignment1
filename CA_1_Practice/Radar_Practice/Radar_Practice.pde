void setup()
{
  fullScreen(P3D);
  TLRadar = new Radar(width/8f, height/9f, 75f, 0.5f, 255f, 98f, 0f, 255f);
}

Radar TLRadar;

boolean RbuttonOn = false;

void draw()
{
  background(0);
  drawRadarButton();
}

void drawRadar()
{
  TLRadar.render();
  TLRadar.update();
}

void drawRadarButton()
{
   //Button position variables
  float RbuttonX = (width/7)*1;
  float RbuttonY = (height/8)*7;
  float RbuttonW = 120;
  float RbuttonH = 50;
  //Button Label variable
  String RbuttonLabel = "Radar";
  
  if (RbuttonOn == false)
  {
    //Make the button off-white if off
    stroke(255);
    fill(#D3D1D1);
  }
  else if (RbuttonOn == true)
  {
    //Make the button pale-orange if on
    stroke(255);
    fill(#FF9829);
  }

  //Draw the button
  rectMode(CENTER);
  rect(RbuttonX, RbuttonY, RbuttonW, RbuttonH);

  //Write the button label
  fill(0);
  textSize(16.5);
  textAlign(CENTER, CENTER);
  text(RbuttonLabel, RbuttonX, RbuttonY, RbuttonW, RbuttonH);
  
  if(RbuttonOn == false)
  {
    if( (mousePressed == true) && (mouseButton==LEFT) && (mouseX<(RbuttonX + (RbuttonW/2) ) ) && (mouseX>(RbuttonX - (RbuttonW/2) ) ) && (mouseY>(RbuttonY - (RbuttonH/2) ) ) && (mouseY<(RbuttonY + (RbuttonH/2) ) ) )
    {
      RbuttonOn = true;
      
      if( (RbuttonOn == true) )
      {
        drawRadar();
      }
      
      drawRadarButton();
      
    }
    
  }
  else if(RbuttonOn == true)
  {
    if( (mousePressed == true) && (mouseButton==LEFT) && (mouseX<(RbuttonX + (RbuttonW/2) ) ) && (mouseX>(RbuttonX - (RbuttonW/2) ) ) && (mouseY>(RbuttonY - (RbuttonH/2) ) ) && (mouseY<(RbuttonY + (RbuttonH/2) ) ) )
    {
      RbuttonOn = false;
      
      if( (RbuttonOn == false) )
      {
        
      }
      
      //drawRadarButton();
      
    }
  }
  
}