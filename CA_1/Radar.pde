class Radar
{
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

  void update()
  {
    angle = angle + speed;
  }

  void render()
  {
    strokeWeight(2);
    stroke(RColor, GColor, BColor, OColor);
    noFill();
    ellipse(center_x, center_y, radius*2, radius*2);
    float trail = 255/4;
    float ColorIntensity = 255f;
    strokeWeight(4);
    for (int i = 0; i < trail; i++)
    {
      stroke(RColor, GColor, BColor, ColorIntensity-(i*(ColorIntensity/trail)));
      float x = center_x + sin(angle - i * speed) * radius;
      float y = center_y - cos(angle - i * speed) * radius;
      line(center_x, center_y, x, y);
    }
  }
}