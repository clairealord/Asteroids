class Ufo extends GameObject { //<>//

  int shotTimer, threshold;

  PVector direction;
  float vx, vy;
  float i1, i2, i3, i4;
  int a, b, randomLength;
  int edge;
  int respTimer;

  Ufo() {

    ufoTimer = 0;
    ufoThreshold = 1000;
    lives = 1;
    respTimer = 5000;
    //int z= (int)Math.ceil((random(0, 4)));
    //int x, y, x1, y1;
    //x1=0;
    //y1=0;
    //switch(z) {
    //case 1: 
    //  y1 = 0;
    //  x1= (int)Math.ceil((random(10, width-10)));
    //  velocity.add(direction);
    //  break;
    //case 2:
    //  x1 =800;
    //  y1= (int)Math.ceil((random(10, height-10)));
    //  velocity.add(direction);
    //  direction.rotate(radians(-5));
    //  break;
    //case 3: 
    //  y1 = 600;
    //  x1= (int)Math.ceil((random(10, width-10)));
    //  velocity.add(direction);
    //  direction.rotate(radians(10));
    //  break;
    //case 4:
    //  x1 =0;
    //  y1= (int)Math.ceil((random(10, height-10)));
    //  velocity.add(direction);
    //  direction.rotate(radians(5));
    //  break;
    //}
    //x=x1;
    //y=y1;
    //location = new PVector(x, y);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    velocity.rotate(random(0, TWO_PI));
    shotTimer = 0;
    threshold = 100;
    size = 50;

    edge = int (random(0, 4));

    if (edge == 0) {
      location = new PVector (random(0, 800), 0);
      velocity = new PVector (0, 3); //go down
    }
    if (edge == 1) {
      location = new PVector (800, random(0, 600));
      velocity = new PVector (-3, 0); //go left
    }
    if (edge == 2) {
      location = new PVector (random(0, 800), 600);
      velocity = new PVector (0, -3); //go up
    }
    if (edge == 3) {
      location = new PVector (0, random(0, 600));
      velocity = new PVector (3, 0); //go right
    }
  }


  void show() {

    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());

    noFill();
    stroke(255);
    square(0, 0, 50);

    popMatrix();

    //fill(255);
    //text("RES:" +respTimer, 750, 450);
  }

  void act() {

    super.act();
    shotTimer++;
    if (shotTimer >= threshold) {
    }

    if (shotTimer > threshold) {

      myObjects.add(new UfoBullets(location.x, location.y));
      shotTimer = 0;
    }

    if (ufoTimer > 0) {
      //velocity.add(direction);
    }

    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          lives = 0;
          score++;
          respTimer--;
        }
      }
      i++;
    }

    //if (respTimer <= 0) {
    //  myObjects.add(new Ufo());
    //  respTimer = 5000;
  }
}
