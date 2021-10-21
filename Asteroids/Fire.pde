class Fire extends GameObject {
  
  int t; //t = transparency
  PVector nudge;
  
  Fire() {
    lives = 1;
    size = 10;
    t = 255;
    location = new PVector (myShip.location.x, myShip.location.y);
    nudge = new PVector (myShip.direction.x, myShip.direction.y);
    nudge.rotate(PI);
    nudge.setMag(27);
    location.add(nudge);
    velocity = new PVector (myShip.direction.x, myShip.direction.y);
    velocity.rotate(PI+random(-1, 1)); //180 degrees = (radians(180));
    velocity.setMag(1);
  }
  
  void show() {
    noStroke();
    fill(255, t);
    square(location.x, location.y, size/2);
  }
  
  void act() {
    super.act();
    t = t -20;
    if (t <= 0) lives = 0;
  }
  
}
