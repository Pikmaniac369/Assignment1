void setup()
{
  fullScreen();
}

void draw()
{
  background(0);
  //Draw the reticle
  drawReticle();
}

void drawReticle()
{
  //Set the color of the reticle to white(RGB=255)
  stroke(255);
  //Make sure you can see through the reticle
  noFill();
  //Draw the reticle
  translate(width/2, height/2);
  ellipse(0, 0, 100, 100);
  fill(255);
  ellipse(0, 0, 10, 10);
}