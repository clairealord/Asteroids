//Claire Lord
//Oct 4, 2021
//Asteroids from Wish

boolean upkey, downkey, leftkey, rightkey, spacekey, teleport;
Ship myShip;
ArrayList<GameObject> myObjects;

PFont lemonMilk, lemonMilk1, lemonMilk2;
PImage[] gif;
int numberOFFrames;
int f, x, y;
int score;
int ufoThreshold, ufoTimer;
int respTimer;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int WIN = 4;

void setup() {
  size (800, 600, FX2D);
  imageMode(CENTER);
  
    myShip = new Ship();
    myObjects = new ArrayList<GameObject>();
    myObjects.add(myShip);
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Ufo());

  rectMode (CENTER);

  if (mode == GAME) {
    ufoTimer++;
  } //-------------------------------------------------------------------------------------------------------------------------ufo
  if (ufoTimer >= 3000) {
    myObjects.add(new Ufo());
    ufoTimer = 0;
  }

  //rectMode(CENTER);

  mode = INTRO;

  lemonMilk = createFont("LEMONMILK-Medium.otf", 125);
  lemonMilk1 = createFont("LEMONMILK-Medium.otf", 40);
  lemonMilk2 = createFont("LEMONMILK-Medium.otf", 75);

  numberOFFrames = 6;
  gif = new PImage[numberOFFrames];

  int i = 0;
  while (i < numberOFFrames) {
    gif[i] = loadImage("frame_"+i+"_delay-0.09s.gif");
    i++;
  }
  
  respTimer = 500;
}

void draw() {

  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == WIN) {
    win();
  } else {
    println("error: mode = " +mode);
  }

  strokeWeight(2);
}

void keyPressed() {
  if (keyCode == UP)    upkey    = true;
  if (keyCode == DOWN)  downkey  = true;
  if (keyCode == LEFT)  leftkey  = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == ' ')       spacekey = true;
  if (key == 't' || key == 'T')       teleport = true; 
 
}

void keyReleased() {
  if (keyCode == UP)    upkey    = false;
  if (keyCode == DOWN)  downkey  = false;
  if (keyCode == LEFT)  leftkey  = false;
  if (keyCode == RIGHT) rightkey = false;
  if (key == ' ')       spacekey = false;
  if (key == 't' || key == 'T')       teleport = false;
}
