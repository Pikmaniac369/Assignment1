class Defence_Matrix
{
  //PShape variable/field
  //PShape Def_Matrix;
  //Index variable/field
  int i;

  Defence_Matrix(PShape Def_Matrix)
  {    
    //this.Def_Matrix = Def_Matrix;

    //Initialise the index variable
    i = 0;
  }

  void render()
  {
    //Draw the Defence Matrix taking the centre of the screen to be the origin(0,0)
    pushMatrix();
    translate(width/2, height/2);
    for (i = 0; i < 3; i++)
    {
      shape(Def_Matrix);
      scale(0.7);
    }
    popMatrix();
    //End the translation
  }
}