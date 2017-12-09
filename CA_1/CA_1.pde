//PShape variable/field
PShape Def_Matrix;

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



  //Initialise the button objects
  DMButton = new Button((width/7)*6, (height/8)*7, 120, 50, "Defence Matrix");
  RButton = new Button((width/7)*1, (height/8)*7, 120, 50, "Radar");
  RKTButton = new Button((width/7)*2, (height/8)*7, 120, 50, "Rockets");
  BButton = new Button((width/7)*5, (height/8)*7, 120, 50, "Boosters");

  //Initialise the Radar object
  TLRadar = new Radar(width/8f, height/9f, 75f, 0.5f, 255f, 98f, 0f, 255f);
}







//Boolean variable to tell whether the stars have already been drawn
boolean StarsDrawn = false;


//Create the Array of Star objects
Star[] stars = new Star[500];
//Create the button objects
Button DMButton;
Button RButton;
Button RKTButton;
Button BButton;
//Create the Defence Matrix object
Defence_Matrix DM = new Defence_Matrix(Def_Matrix);
//Create the Radar object
Radar TLRadar;



//BULLETS WILL BE WITHIN THE CIRCLE IF THE DISTANCE BETWEEN THEIR POINT AND THE CENTRE OF THE CIRCLE IS LESS THAN THE RADIUS OF THE CIRCLE












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
  //--------------->If the buttons are On, draw the corressponding objects <-------------------

  if (DMButton.ButtonOn == true)
  {
    DM.render();
  }

  if (RButton.ButtonOn == true)
  {
    TLRadar.render();
    TLRadar.update();
  }
}














void drawStars()
{
  

  for (int i = 0; i < stars.length; i++)
  {
    stars[i].render();
  }

  
}



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
  DMButton.render();
  RButton.render();
  RKTButton.render();
  BButton.render();
}










void mouseClicked()
{
  if ( (mouseX < (DMButton.ButtonX + (DMButton.ButtonW / 2) ) ) && (mouseX > DMButton.ButtonX - (DMButton.ButtonW / 2) ) && (mouseY > (DMButton.ButtonY - (DMButton.ButtonH / 2)) ) && (mouseY < (DMButton.ButtonY + (DMButton.ButtonH / 2) ) ) )//USE VOID UPDATE FOR EACH OBJECT THEN GO BACK TO DRAW
  {
    DMButton.update();
  } else if ( (mouseX < (RButton.ButtonX + (RButton.ButtonW / 2) ) ) && (mouseX > RButton.ButtonX - (RButton.ButtonW / 2) ) && (mouseY > (RButton.ButtonY - (RButton.ButtonH / 2)) ) && (mouseY < (RButton.ButtonY + (RButton.ButtonH / 2) ) ) )//USE VOID UPDATE FOR EACH OBJECT THEN GO BACK TO DRAW
  {
    RButton.update();
  } else if ( (mouseX < (RKTButton.ButtonX + (RKTButton.ButtonW / 2) ) ) && (mouseX > RKTButton.ButtonX - (RKTButton.ButtonW / 2) ) && (mouseY > (RKTButton.ButtonY - (RKTButton.ButtonH / 2)) ) && (mouseY < (RKTButton.ButtonY + (RKTButton.ButtonH / 2) ) ) )//USE VOID UPDATE FOR EACH OBJECT THEN GO BACK TO DRAW
  {
    RKTButton.update();
  } else if ( (mouseX < (BButton.ButtonX + (BButton.ButtonW / 2) ) ) && (mouseX > BButton.ButtonX - (BButton.ButtonW / 2) ) && (mouseY > (BButton.ButtonY - (BButton.ButtonH / 2)) ) && (mouseY < (BButton.ButtonY + (BButton.ButtonH / 2) ) ) )//USE VOID UPDATE FOR EACH OBJECT THEN GO BACK TO DRAW
  {
    BButton.update();
  } else
  {
  }
}