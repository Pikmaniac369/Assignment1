//Defence Matrix object
PShape Def_Matrix;
int i = 0;

void setup()
{
  fullScreen();
  //size(500, 500);
  
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

void draw()
{
  background(0);
  drawDefMatrixButton();
  translate(width/2, height/2);
  
  for(i=0; i<3; i++)
  {
    
    drawDefenceMatrix();
    scale(0.7);
  }
  
  
  //shape(Def_Matrix);
}

void drawDefenceMatrix()
{
  shape(Def_Matrix);
  
  /*scale(0.8);
  translate(0, 0);
  shape(Def_Matrix);*/
}

void drawDefMatrixButton()
{
  //Button position variables
  float buttonX = (width/5)*4;
  float buttonY = (height/8)*7;
  float buttonW = 120;
  float buttonH = 50;
  //Button Label variable
  String buttonLabel = "Defence Matrix";
  
  //Make the button off-white while off
  stroke(255);
  fill(#D3D1D1);
  
  //Draw the button while off
  rectMode(CENTER);
  rect(buttonX, buttonY, buttonW, buttonH);
  
  //Write the button label
  fill(0);
  textSize(16.5);
  text(buttonLabel, buttonX, buttonY, buttonW, buttonH);
}