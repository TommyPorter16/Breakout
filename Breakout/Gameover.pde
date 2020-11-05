void gameover() {
  
  
  if (scoring==n) {
    textSize(80);
    textAlign(CENTER,CENTER);
    fill(255);
    text("YOU WIN",400,300);
  } 
  if (lives == 0) {
    textSize(80);
    textAlign(CENTER,CENTER);
    fill(255);
    text("YOU LOSE",400,300); 
    clapping.play();
  }
  reset();
}

void gameoverClicks() {
  mode = INTRO;
}
