void win() {
  background(0);

  textAlign(CENTER);
  fill(255);
  textSize(75);
  textFont(lemonMilk2);
  text("YOU WIN!", width/2, 250);

  textSize(25);
  text("CONGRATUALTIONS", width/2, 350);
  text("CLICK ANYWHERE TO CONTINUE", width/2, 375);
}

void winClicks() {
  
  if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 600) {
    mode = INTRO;
    setup();
  }
  
}
