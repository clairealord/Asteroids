void intro () {
  
  background (0);
 
   image(gif[f], width/2, height/2, width, height);
   f = f+ 1;
   if (f == numberOFFrames) f = 0;
  
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(50);
  textFont(lemonMilk);
  text("ASTEROIDS", width/2, 125);
  textSize(25);
  text("I DIDN'T PROCRASTINATE, I'M JUST STUPID", width/2, 225);
  
  stroke(255);
  strokeWeight(5);
  noFill();
  rect(width/2, 450, 200, 50);
  textFont(lemonMilk1);
  text("QUIT", width/2, 443, 50);
  
  rect(width/2, 350, 200, 50);
  fill(255);
  textFont(lemonMilk1);
  text("PLAY", width/2, 343, 40);
  
}

void introClicks() {
  if (mouseX > 300 && mouseX < 500 && mouseY > 325 && mouseY < 375) {
    mode = GAME;
  }
   if (mouseX > 300 && mouseX < 500 && mouseY > 425 && mouseY < 475) {
    exit();
  }
}
