//Tommy Porter
//Block 1-1a
//October 27,2020

//pallette of colours
  color cultured = #F9F8F8;
  color wolf = #CDD3CE;
  color shadows = #BBB5BD;
  color pearl = #AA6DA3;
  color purple = #B118C8;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

float paddlex,paddley,paddled;
float ballx,bally,balld; 

//Bricks Variables

//ARRAYS
int[] x;
int[] y;
boolean[] alive;
float brickd;
int n;
int tempx, tempy;

//ball movement
float vballx, vbally;

//keyboard variables
boolean akey,dkey;

//distance and radiace
float pd,pr,br;

// score and lives
int scoring, lives;


//breakout sign
float breakoutSize;

//pong font
PFont transformers;

//sound variables
Minim minim;
AudioPlayer paddle,score,wall,clapping,intro;

//gif
PImage[] gif; 
int numberOfFrames;

int f;

void setup() {
  brickd = 30;
  n = 60;
  x = new int[n];
  y = new int[n];
  tempx = 105;
  tempy = 100;
  alive = new boolean[n];
  
  int i =0;
  while (i<n) {
   x[i] = tempx;
   y[i] = tempy;
   alive[i] = true;
   tempx = tempx + 40;
   if (tempx == width-95) {
    tempx= 105;
    tempy = tempy+60;
   }
   i++;
  }
  
  size(800,800,P2D);
  mode = INTRO;
  
  //initializing paddles
  paddlex = width/2;
  paddley = height;
  paddled = 100;
  
  //initializing ball stuff
  ballx = width/2;
  bally = height/2;
  balld = 20;
  vballx = 0;
  vbally = 7;
  
  
  //initializing keyboard variables
  akey = dkey = false;
  
  //initializing distance
  pd=dist(paddlex,paddley,ballx,bally);
  
  pr=paddled/2;
  br=balld/2;
  
  //breakout sign
  breakoutSize = 10;
  
  //score and lives
  scoring = 0;
  lives = 3;
  
  //initializing font
  transformers = createFont("Transformers Movie.ttf",200);
  
  //minim
  minim = new Minim(this);
  paddle=minim.loadFile("rightpaddle.wav");
  score=minim.loadFile("score.wav");
  wall=minim.loadFile("wall.wav");
  clapping=minim.loadFile("clapping.wav");
  intro=minim.loadFile("intro.wav");
  
  //gif
   f=0;
  
  numberOfFrames = 30;
  gif = new PImage[numberOfFrames];
  
  int itwo = 0;
  while(itwo < numberOfFrames) {
    gif[itwo] = loadImage("frame_"+itwo+"_delay-0.03s.gif");
    
    itwo++;
  }
  
}


void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else{
     println("Mode error: " + mode); 
  }
  
  
  
}
