void pause() {
  background(0);
  
  textAlign(CENTER);
  fill(255);
  textSize(75);
  textFont(lemonMilk2);
  text("PAUSED", width/2, 250);
  
  textSize(25);
  text("CLICK ANYWHERE", width/2, 350);
  text("TO CONTINUE", width/2, 375);
}

void pauseClicks() {
  if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 600) {
    mode = GAME;
  }
}
