//Defence Matrix object
PShape Def_Matrix;
int i = 0;

void setup()
{
  fullScreen(P3D);

  //Create the shape
  Def_Matrix = createShape();
  Def_Matrix.beginShape();
  //Set fill and stroke
  Def_Matrix.noFill();
  Def_Matrix.stroke(#42E379);//RGB(66, 227, 121) OR HSB(140, 70, 88)
  Def_Matrix.strokeWeight(1);
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
}

//Button On/Off
boolean DMbuttonOn = false;
void draw()
{
  background(0);
  drawDefMatrixButton();
  

}

void drawDefenceMatrix()
{
  shape(Def_Matrix);
}

void drawDefMatrixButton()
{
  //Button position variables
  float DMbuttonX = (width/7)*6;
  float DMbuttonY = (height/8)*7;
  float DMbuttonW = 120;
  float DMbuttonH = 50;
  //Button Label variable
  String DMbuttonLabel = "Defence Matrix";

  if (DMbuttonOn == false)
  {
    //Make the button off-white if off
    stroke(255);
    fill(#D3D1D1);
  }
  else if (DMbuttonOn == true)
  {
    //Make the button pale-orange if on
    stroke(255);
    fill(#FF9829);
  }

  //Draw the button
  rectMode(CENTER);
  rect(DMbuttonX, DMbuttonY, DMbuttonW, DMbuttonH);

  //Write the button label
  fill(0);
  textSize(16.5);
  textAlign(CENTER, CENTER);
  text(DMbuttonLabel, DMbuttonX, DMbuttonY, DMbuttonW, DMbuttonH);
  
  if(DMbuttonOn == false)
  {
    if( (mousePressed == true) && (mouseButton==LEFT) && (mouseX<(DMbuttonX + (DMbuttonW/2) ) ) && (mouseX>(DMbuttonX - (DMbuttonW/2) ) ) && (mouseY>(DMbuttonY - (DMbuttonH/2) ) ) && (mouseY<(DMbuttonY + (DMbuttonH/2) ) ) )
    {
      DMbuttonOn = true;
      
      if( (DMbuttonOn == true) )
      {
        pushMatrix();
        translate(width/2, height/2);
        for (i=0; i<3; i++)
        {
          drawDefenceMatrix();
          scale(0.7);
        }
        popMatrix();
      }
      
      drawDefMatrixButton();
      
    }
    
    DMbuttonOn = false;
  } 
}