void gameover() {

  background(0);

  textAlign(CENTER);
  fill(255);
  textSize(75);
  textFont(lemonMilk2);
  text("GAME OVER", width/2, 200);

  stroke(255);
  strokeWeight(5);
  noFill();
  rect(width/2, 450, 200, 50);
  textFont(lemonMilk1);
  text("MENU", width/2, 465, 50);

  rect(width/2, 350, 250, 50);
  fill(255);
  textFont(lemonMilk1);
  text("TRY AGAIN", width/2, 365, 40);
}

void gameoverClicks() {
  if (mouseX > 350 && mouseX < 500 && mouseY > 425 && mouseY < 525) {
    mode = INTRO;
    setup();
  }
  if (mouseX > 250 && mouseX < 500 && mouseY > 325 && mouseY < 375) {
    mode = GAME;
    setup();
  }
}
