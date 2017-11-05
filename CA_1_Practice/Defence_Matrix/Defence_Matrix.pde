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