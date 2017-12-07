class Button
{
  //Button On/Off
  boolean ButtonOn;
  //Button position variables/fields
  float ButtonX;
  float ButtonY;
  float ButtonW;
  float ButtonH;
  //Button label variable/field
  String ButtonLabel;
  
  Button(float ButtonX, float ButtonY, float ButtonW, float ButtonH, String ButtonLabel)
  {
    this.ButtonOn = false;
    this.ButtonX = ButtonX;
    this.ButtonY = ButtonY;
    this.ButtonW = ButtonW;
    this.ButtonH = ButtonH;
    this.ButtonLabel = ButtonLabel;
  }
  
  void update()
  {
    if(ButtonOn == false)
    {
      ButtonOn = true;
    }
    else if(ButtonOn == true)
    {
      ButtonOn = false;
    }
  }
  
  void render()
  {
    if(ButtonOn == false)
    {
      //Make the button off-white if off
      stroke(255);
      fill(#D3D1D1);
    }
    else if(ButtonOn == true)
    {
      //Make the button pale-orange if on
      stroke(255);
      fill(#FF9829);
    }
    pushMatrix();
    //Draw the button
    rectMode(CENTER);
    rect(ButtonX, ButtonY, ButtonW, ButtonH);
  
    //Write the button label
    fill(0);
    textSize(16.5);
    textAlign(CENTER, CENTER);
    text(ButtonLabel, ButtonX, ButtonY, ButtonW, ButtonH);
    popMatrix();
  }
}