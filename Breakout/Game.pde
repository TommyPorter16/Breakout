void game() {
  background(0);

  //move paddles
  if (akey == true) paddlex = paddlex -7.5;
  if (dkey == true) paddlex = paddlex +7.5;

  if (paddlex < 50) paddlex = 50;
  if (paddlex > 750) paddlex = 750;

  //paddles
  strokeWeight(1);
  stroke(0);
  fill(purple);
  circle(paddlex, paddley, paddled);


  //ball
  fill(255);
  circle(ballx, bally, balld);

  //move ball
  ballx = ballx + vballx;
  bally = bally + vbally;

  //distances between shapes
  pd=dist(paddlex, paddley, ballx, bally);

  //bouncing
  if (ballx>width-balld/2 || ballx<balld/2) {
    vballx = vballx*-1;
    wall.rewind();
    wall.play();
  }

  if (bally<balld/2) {
    vbally = vbally*-1;
    wall.rewind();
    wall.play();
  }

  //bouncing into the paddles
  if (pd<=pr+br) {
    vballx=(ballx-paddlex)/10;
    vbally=(bally-paddley)/10;
  }

  if (bally>height+15) {
    lives = lives - 1;
    bally = height/2;
    ballx = width/2;
    vballx = 0;
    vbally = 10;
  }

  //bricks

  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      if (y[i] == 100) fill(cultured);
      if (y[i] == 160) fill(wolf); 
      if (y[i] == 220) fill(shadows);
      if (y[i] == 280) fill(pearl); 
      manageBrick(i);
    }
    i = i + 1;
  }

  //score sign
  textSize(20);
  textAlign(CENTER, CENTER);
  fill(255);
  text("SCORE: "+scoring, width-50, height-50);

  //score sign
  textSize(20);
  textAlign(CENTER, CENTER);
  fill(255);
  text("Lives: "+lives, 50, height-50);


  if (scoring == n || lives == 0) {
    mode = GAMEOVER;
  }
}

void gameClicks() {
  mode = PAUSE;
}


void manageBrick (int i) {
  //blocks disapearing and scoring

  circle(x[i], y[i], brickd);
  if (dist(ballx, bally, x[i], y[i]) < balld/2-3 + brickd/2) {
    vballx=(ballx-x[i])/5;
    vbally=(bally-y[i])/5;
    scoring = scoring +1;
    alive[i] = false;
    score.rewind();
    score.play();
  }
}
