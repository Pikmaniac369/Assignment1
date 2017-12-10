class Reticle
{
  //Variables/fields relating to the properties of the Reticle
  color RetColor;
  float RetCenX;
  float RetCenY;
  float RetRadius;

  Reticle(color RetColor, float RetCenX, float RetCenY, float RetRadius)
  {
    this.RetColor = RetColor;
    this.RetCenX = RetCenX;
    this.RetCenY = RetCenY;
    this.RetRadius = RetRadius;
  }

  void render()
  {
    //Set the reticle color
    stroke(RetColor);
    noFill();
    //Draw the reticle
    ellipse(RetCenX, RetCenY, RetRadius * 2, RetRadius *2);
    //Draw the centre of the reticle
    fill(RetColor);
    ellipse(RetCenX, RetCenY, (RetRadius / 5) *2, (RetRadius / 5) * 2 );
  }
}