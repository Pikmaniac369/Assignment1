//Import the minim sound library
import ddf.minim.*;

Minim  minim;

//Sound files
AudioPlayer DM_Audio;
AudioPlayer Guns_Audio;
AudioPlayer Hyperspace_Audio;
AudioPlayer Radar_Audio;

//PShape variables/fields
PShape Def_Matrix;
PShape Con_Pan;

void setup()
{
  //Make the screen fullscreen
  fullScreen(P3D, 1);

  //Create the Def_Matrix shape
  Def_Matrix = createShape();
  Def_Matrix.beginShape();
  //Set fill and stroke
  Def_Matrix.noFill();
  Def_Matrix.stroke(#42E379);//RGB(66, 227, 121) OR HSB(140, 70, 88)
  Def_Matrix.strokeWeight(2);
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

  //Create the Con_Pan shape
  Con_Pan = createShape();
  Con_Pan.beginShape();
  //Set fill and stroke
  Con_Pan.fill(255, 0, 0, 255);
  Con_Pan.stroke(255, 0, 0, 255);
  Con_Pan.strokeWeight(2);
  //Draw the Control Panel
  Con_Pan.vertex(0, (height/8)*6.6 );
  Con_Pan.vertex( (width/5) * 1, (height/8) * 6.6);
  Con_Pan.vertex( (width/5) * 4, (height/8) * 6.6);
  Con_Pan.vertex(width, (height/8) * 6.6);
  Con_Pan.vertex(width, height);
  Con_Pan.vertex(0, height);
  Con_Pan.vertex(0, (height/8)*6.6 );
  Con_Pan.endShape(CLOSE);

  //Initialise the button objects
  DMButton = new Button((width/7)*6, (height/8)*7, 120, 50, "Defence Matrix");
  RButton = new Button((width/7)*1, (height/8)*7, 120, 50, "Radar");
  GunButton = new Button((width/7)*2, (height/8)*7, 120, 50, "Guns");
  BButton = new Button((width/7)*5, (height/8)*7, 120, 50, "Boosters");

  //Initialise the Radar object
  TLRadar = new Radar(width/8f, (height/9f) * 1.5, 75f, 0.35f, 255f, 155f, 0f, 255f);
  //Initialise the Reticle object
  Ret = new Reticle(color(255, 155, 0), width/2, height/2, 25f);

  minim = new Minim(this);

  //Initialise the Sound files
  DM_Audio = minim.loadFile("Defence_Matrix.mp3");
  Guns_Audio = minim.loadFile("Gun.mp3");
  Hyperspace_Audio = minim.loadFile("Hyperspace.mp3");
  Radar_Audio = minim.loadFile("Radar.mp3");
}

//Boolean variable to tell whether the stars have already been drawn
boolean StarsDrawn = false;

//Create the Array of Star objects
Star[] stars = new Star[1000];

//Create the button objects
Button DMButton;
Button RButton;
Button GunButton;
Button BButton;

//Create the Defence Matrix object
Defence_Matrix DM = new Defence_Matrix(Def_Matrix);
//Create the Radar object
Radar TLRadar;
//Create the Reticle object
Reticle Ret;

//Boolean variable to tell whether the Guns have been fired
boolean GunsFired = false;

//Create the array of Gun objects
Gun[] guns = new Gun[18];

void draw()
{
  //Make the background black
  background(0);

  //If the stars haven't been drawn yet
  if (StarsDrawn == false)
  {
    makeStars();
  }

  //Draw the stars
  drawStars();

  //Draw the control panel and buttons
  drawControlPanel();

  //--------------->If the buttons are On, draw the corressponding objects<-------------------
  //If the Defence Matrix button is on, draw the Defence Matrix and play its audio
  if (DMButton.ButtonOn == true)
  {

    DM.render();
    DM_Audio.play();
  }

  if (DMButton.ButtonOn == false)
  {
    DM_Audio.rewind();
  }

  //If the Booster button is on, draw the warp_speed effect
  if (BButton.ButtonOn == true)
  {
    if (Hyperspace_Audio.isPlaying() == false)
    {
      Hyperspace_Audio.rewind();
    }
    Hyperspace_Audio.play();
    pushMatrix();

    translate(width/2, height/2);
    for (Star s : stars)
    {
      s.warp_speed();
    }
    popMatrix();
  }

  if (BButton.ButtonOn == false)
  {

    Hyperspace_Audio.rewind();
  }

  //If the Rocket button is on and the Rockets haven't been fired, draw and update the bullets
  if (GunButton.ButtonOn == true && GunsFired == false)
  {
    if (Guns_Audio.isPlaying() == false)
    {
      Guns_Audio.rewind();
    }
    Guns_Audio.play();
    Shoot();
    //RocketsFired = true;
  }

  //If the Rocket button is off, set the Rockets to not having been fired
  if (GunButton.ButtonOn == false)
  {
    Guns_Audio.rewind();
    GunsFired = false;
  }

  Radar_Audio.setLoopPoints(1, Radar_Audio.length());

  //If the Radar button is on, draw the Radar
  if (RButton.ButtonOn == true)
  {
    if (Radar_Audio.isPlaying() == false)
    {
      Radar_Audio.rewind();
    }
    Radar_Audio.play();
    TLRadar.render();
    TLRadar.update();
  }

  if (RButton.ButtonOn == false)
  {
    Radar_Audio.rewind();
  }

  //--------------->If WASD or UP, DOWN, LEFT or RIGHT are pressed, move the stars to simulate the ship moving<-------------------
  //If W or UP is pressed, move the stars towards the screen to simulate the ship moving forward
  if (keyPressed == true && (key == 'w' || key == 'W' || keyCode == UP))
  {

    for (int i = 0; i < stars.length; i++)
    {
      stars[i].updateF();
    }
  }

  //If S or DOWN is pressed, move the stars away from the screen to simulate the ship moving backwards
  if (keyPressed == true && (key == 's' || key == 'S' || keyCode == DOWN))
  {

    for (int i = 0; i < stars.length; i++)
    {
      stars[i].updateB();
    }
  }

  //If A or LEFT is pressed, move the stars to the right to simulate the ship moving left
  if (keyPressed == true && (key == 'a' || key == 'A' || keyCode == LEFT))
  {

    for (int i = 0; i < stars.length; i++)
    {
      stars[i].updateL();
    }
  }

  //If D or RIGHT is pressed, move the stars to the left to simulate the sip moving right
  if (keyPressed == true && (key == 'd' || key == 'D' || keyCode == RIGHT))
  {

    for (int i = 0; i < stars.length; i++)
    {
      stars[i].updateR();
    }
  }
}

//Function to display the stars to the screen
void drawStars()
{
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < stars.length; i++)
  {
    stars[i].render();
  }
  popMatrix();
}

//Function to make Star objects and insert them into an array
void makeStars()
{
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }

  StarsDrawn = true;
}

//Draw the Control Panel that will contain the buttons
void drawControlPanel()
{
  shape(Con_Pan);
  DMButton.render();
  RButton.render();
  GunButton.render();
  BButton.render();
  Ret.render();
}

void Shoot()
{
  makeAmmo();

  fireGuns();
}

void makeAmmo()
{
  for (int i = 0; i < guns.length; i++)
  {
    if (frameCount % 2 == 0)
    {
      guns[i] = new Gun(0f, (height/8)*6);
    } else if (frameCount % 2 == 1)
    {
      guns[i] = new Gun(width, (height/8)*6);
    }
  }
}

void fireGuns()
{
  for (Gun g : guns)
  {
    g.render();
    g.update();
  }
}

//Change the state of the buttons when they are clicked
void mouseClicked()
{
  if ( (mouseX < (DMButton.ButtonX + (DMButton.ButtonW / 2) ) ) && (mouseX > DMButton.ButtonX - (DMButton.ButtonW / 2) ) && (mouseY > (DMButton.ButtonY - (DMButton.ButtonH / 2)) ) && (mouseY < (DMButton.ButtonY + (DMButton.ButtonH / 2) ) ) )//USE VOID UPDATE FOR EACH OBJECT THEN GO BACK TO DRAW
  {
    DMButton.update();
  }
  else if ( (mouseX < (RButton.ButtonX + (RButton.ButtonW / 2) ) ) && (mouseX > RButton.ButtonX - (RButton.ButtonW / 2) ) && (mouseY > (RButton.ButtonY - (RButton.ButtonH / 2)) ) && (mouseY < (RButton.ButtonY + (RButton.ButtonH / 2) ) ) )//USE VOID UPDATE FOR EACH OBJECT THEN GO BACK TO DRAW
  {
    RButton.update();
  }
  else if ( (mouseX < (GunButton.ButtonX + (GunButton.ButtonW / 2) ) ) && (mouseX > GunButton.ButtonX - (GunButton.ButtonW / 2) ) && (mouseY > (GunButton.ButtonY - (GunButton.ButtonH / 2)) ) && (mouseY < (GunButton.ButtonY + (GunButton.ButtonH / 2) ) ) )//USE VOID UPDATE FOR EACH OBJECT THEN GO BACK TO DRAW
  {
    GunButton.update();
  }
  else if ( (mouseX < (BButton.ButtonX + (BButton.ButtonW / 2) ) ) && (mouseX > BButton.ButtonX - (BButton.ButtonW / 2) ) && (mouseY > (BButton.ButtonY - (BButton.ButtonH / 2)) ) && (mouseY < (BButton.ButtonY + (BButton.ButtonH / 2) ) ) )//USE VOID UPDATE FOR EACH OBJECT THEN GO BACK TO DRAW
  {
    BButton.update();
  }
  else
  {
  }
}