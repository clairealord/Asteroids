void game() {
  background(0);
  
  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();

    if (myObj.lives == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }

  respTimer--;

  if (respTimer <=0) {
    myObjects.add(new Ufo());
    respTimer = 500;
  }

  noFill();
  stroke(255);
  strokeWeight(5);
  square(750, 50, 50);

  noStroke();
  fill(255);
  rect(740, 50, 10, 30);
  rect(760, 50, 10, 30);
}

void gameClicks() {
  if (mouseX > 725 && mouseX < 775 && mouseY > 25 && mouseY < 75) {
    mode = PAUSE;
  }
}
