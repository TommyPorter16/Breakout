void extra() {
  
}

void reset () {
 ballx=width/2;
 bally=height/2;
 vballx=0;
 vbally=10;
 paddlex=width/2;
 paddley=height;
 scoring = 0;
 lives = 3;
 int i = 0;
  while (i < n) {
    if (alive[i] == false) {
      alive[i] = true;
    }
  i = i + 1;
  }
}
