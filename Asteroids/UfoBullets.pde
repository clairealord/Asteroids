class UfoBullets extends GameObject {

  int timer;

  UfoBullets(float x, float y) {
    timer = 20;
    lives = 1;
    location = new PVector (x, y);
    float vx = myShip.location.x - location.x;
    float vy = myShip.location.y - location.y;
    velocity = new PVector(vx, vy);
    velocity.setMag(20);
    size = 5;
  }

  void show() {

    stroke(255);
    noFill();
    ellipse(location.x, location.y, size, size);
  }

  void act() {

    timer--;
    if (timer <= 0) {
      lives = 0;
    }

    location.add (velocity);
  }
}
