//Defence Matrix object
PShape Def_Matrix;
int i = 0;

void setup()
{
  fullScreen();

  //Create the shape
  Def_Matrix = createShape();
  Def_Matrix.beginShape();
  //Set fill and stroke
  Def_Matrix.noFill();
  Def_Matrix.stroke(/*#9FE342*/#42E379);
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
  translate(width/2, height/2);

  for (i=0; i<3; i++)
  {

    drawDefenceMatrix();
    scale(0.7);
  }

}

void drawDefenceMatrix()
{
  shape(Def_Matrix);
}

void drawDefMatrixButton()
{
  //Button position variables
  float DMbuttonX = (width/5)*4;
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
  text(DMbuttonLabel, DMbuttonX, DMbuttonY, DMbuttonW, DMbuttonH);
}