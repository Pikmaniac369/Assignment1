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
    pushMatrix();
    translate(width/2, height/2);
    for (i = 0; i < 3; i++)
    {
      shape(Def_Matrix);
      scale(0.7);
    }
    popMatrix();
  }
}