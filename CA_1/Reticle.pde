class Reticle
{
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
    //Make the reticle see-through
    noFill();
    //Draw the reticle
    ellipse(RetCenX, RetCenY, RetRadius, RetRadius);
    fill(RetColor);
    ellipse(RetCenX, RetCenY, RetRadius / 10, RetRadius / 10);
  }
}