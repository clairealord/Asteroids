class Ship extends GameObject {

  PVector direction;
  int shotTimer, threshold, immTimer;

  Ship() {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 50;
    size = 25;
    immTimer = 100;
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());

    noFill();
    if (immTimer <= 0) {
      stroke(255);
    } else {
      stroke(255, 0, 0);
    }
    triangle(-25, -12.5, -25, 12.5, size, 0); //-----------------------

    popMatrix();

    textSize(25);
    fill(255);
    text("LIVES:" +lives, 750, 575);

    //fill(0);
    //text("IMM:" +immTimer, 750, 500);
  }

  void act() {
    super.act();
    health = 3;

    shotTimer++;

    if (upkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
    }
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate(radians(-5));
    if (rightkey) direction.rotate(radians(5));
    if (spacekey && shotTimer > threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
    }

    if (velocity.mag() > 5) {
      velocity.setMag(5);
    }

    int i = 0;
    while (i < myObjects.size()) {
      if (immTimer <= 0) {
        GameObject myObj = myObjects.get(i);
        if (myObj instanceof Asteroid) {
          if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2) {
            lives--;
            immTimer = 100;
            myObj.lives = 0;
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
          }
        }
        if (myObj instanceof UfoBullets) {
          if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
            immTimer = 100;
            myObj.lives = 0;
            lives--;
          }
        }
      }
      i++;
    }

    
    if (immTimer >= 0) {
      immTimer--;
    }


    if (lives <= 0) {
      mode = GAMEOVER;
    }

    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (teleport == true) {
        location = new PVector(random(0, 800), (random(0, 600)));
      } else {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2) {
          location = new PVector(random(0, 800), (random(0, 600)));
        }
      }
    }

    if (mode == GAMEOVER) {
      lives = 3;
    }

    if (mode == INTRO) {
      lives = 3;
    }
  }
}
