class Radar
{
  //Variables/fields relating to the properties of the Radar
  float center_x;
  float center_y;
  float radius;
  float angle;
  float speed;
  float freq;
  float RColor;
  float GColor;
  float BColor;
  float OColor;

  Radar(float center_x, float center_y, float radius, float freq, float RColor, float GColor, float BColor, float OColor)
  {
    this.center_x = center_x;
    this.center_y = center_y;
    this.radius = radius;
    this.angle = 0;
    this.freq = freq;
    this.speed = (TWO_PI/60.0) * freq;
    this.RColor = RColor;
    this.GColor = GColor;
    this.BColor = BColor;
    this.OColor = OColor;
  }

  //Move the scanner part of the Radar by changing the angle
  void update()
  {
    angle = angle + speed;
  }

  void render()
  {
    //Set the stroke weight of the Radar
    strokeWeight(2);
    //Set the color of the Radar and make sure it is hollow
    stroke(RColor, GColor, BColor, OColor);
    noFill();
    //Draw the outer part of the Radar
    ellipse(center_x, center_y, radius*2, radius*2);
    //Set the legth of the scanner's trail
    float trail = 255/4;
    float ColorIntensity = 255f;
    //Set the scanner's stroke weight
    strokeWeight(4);
    //Draw the Radar's scanner
    for (int i = 0; i < trail; i++)
    {
      //Set the scanner's stroke color
      stroke(RColor, GColor, BColor, ColorIntensity-(i*(ColorIntensity/trail)));
      float x = center_x + sin(angle - i * speed) * radius;
      float y = center_y - cos(angle - i * speed) * radius;
      line(center_x, center_y, x, y);
    }
  }
}