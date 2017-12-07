class Defence_Matrix
{
  //PShape variable/field
  PShape Def_Matrix;
  //Index variable/field
  int i;
  
  Defence_Matrix()
  {
    //Create the Def_Matrix shape
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
    //Finish creating the Def_Matrix shape
    
    //Initialise the index variable
    i = 0;
  }
  
  void render()
  {
    pushMatrix();
    translate(width/2, height/2);
    for(i = 0; i < 3; i++)
    {
      shape(Def_Matrix);
      scale(0.7);
    }
    popMatrix();
  }
}