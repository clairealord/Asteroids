class Bullet extends GameObject {

  int timer;

  Bullet() {

    timer = 20;
    lives = 1;
    location = new PVector (myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(20);
    size = 5;
  }

  void show() {
    stroke(255);
    noFill();
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();

    timer--;
    if (timer <= 0) {
      lives = 0;
    }
  }
}
