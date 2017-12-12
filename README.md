# Assignment1

## Instructions On How To Use The User Interface
The UI consists of four buttons: Radar, Guns, Boosters and Defence Matrix. Pressing a button turns it on. When on, each button performs a different function. The Radar button displays an orange ellipse with a line that updates each frame, giving the effect of the line rotating around the ellipse's centre, creating a radar. The Guns button is supposed to create 9 'bullets' on each side of the screen that update each frame and move towards the reticle, where they disappear. Unfortunately, I could not get them to work properly and they just rapidly flicker instead. The Boosters button causes the stars to move rapidly towards the screen, creating the illusion of moving at light speed/warp speed. The Defence Matrix button brings up a holographic shape created using PShape. It is based on the Defence Matrix from D.Va's Mech in Overwatch. The buttons also play audio when pressed and the user can move through the stars by pressing WASD or the UP, DOWN, LEFT and RIGHT arrow keys.

## How I Did The Assignment
I started the assignment by first creating a set of practice files. I did this as I struggle with this module quite a bit and was not sure where to start. I created a practice file for almost everything I wanted to include. I have included the practice files in the folder CA_1_Practice.

After finishing with the practice files, I moved on to the main Sketch. I named the project CA_1 and it has six classes: Button, Defence_Matrix, Radar, Reticle, Gun and Star. Button holds the fields and methods for drawing and updating the buttons at the bottom of the UI. Defence_Matrix has the methods for drawing the Defence Matrix when its button is pressed. Radar holds the fields and methods for drawing and updating the Radar when its button is pressed. Reticle holds the fields and methods for drawing the reticle. Gun holds the fields and methods for drawing and attempting (without success) to fire the guns when their button is pressed. Star holds the fields and methods for drawing and updating the stars as well as creating the hyperspace effect when the Boosters button is pressed.

I made numerous attempts to make the guns work. I have included these failed attempts in the CA_1_Practice folder as Rocket_Practice and Bullet_Practice.

I have also included several audio files in the project's data folder. These files are incorporated using the Minim Sound Library and are used when the buttons are pressed.

As for what I'm most proud of in regards to this assignment, I would have to say the Radar effect of the Radar button and the hyperspace effect of the Boosters button. I had no idea how to use geometry or the z-axis in coding and yet I managed to complete these parts of the assignment. For this reason alone, I am most proud of the Radar and the hyperspace effect.

## Link To My YouTube Video Of This Assignment
[![YouTube](http://img.youtube.com/vi/O5EslqlbkiU/0.jpg)](https://www.youtube.com/watch?v=O5EslqlbkiU)