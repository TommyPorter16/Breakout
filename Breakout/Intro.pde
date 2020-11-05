void intro() {
  image(gif[f],0,0,width,height);
  f=f+1;
  if (f== numberOfFrames) f=0;
  

  
  intro.play();
  
  reset();
  
  textFont(transformers);
  textSize(breakoutSize);
  textAlign(CENTER,CENTER);
  fill(255,3,3);
  text("BREAKOUT",400,400);
  
  breakoutSize = breakoutSize + 1;
  
  if (breakoutSize > 120) {
    breakoutSize = 10;
  } 
}

void introClicks() {
mode = GAME;
}
