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

  //Change the button's state from On to Off or Off to On
  void update()
  {
    if (ButtonOn == false)
    {
      //Off to On
      ButtonOn = true;
    } 
    else if (ButtonOn == true)
    {
      //On to Off
      ButtonOn = false;
    }
  }

  void render()
  {
    if (ButtonOn == false)
    {
      //Make the button off-white if off
      stroke(255);
      fill(0);
    } else if (ButtonOn == true)
    {
      //Make the button pale-orange if on
      stroke(255);
      fill(#FF9829);
    }
    //pushMatrix();
    //Draw the button
    rectMode(CENTER);
    rect(ButtonX, ButtonY, ButtonW, ButtonH);

    //Write the button label
    fill(255);
    textSize(16.5);
    textAlign(CENTER, CENTER);
    text(ButtonLabel, ButtonX, ButtonY, ButtonW, ButtonH);
    //popMatrix();

    println(ButtonLabel, ButtonX, ButtonY, ButtonW, ButtonH);
  }
}