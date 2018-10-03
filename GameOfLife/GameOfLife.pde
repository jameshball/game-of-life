Grid grid;
int randomSeed = (int)random(Integer.MAX_VALUE);
float zoom = 1;

void setup() {
  size(1700, 800, P2D);
  frameRate(100);
  randomSeed(randomSeed);
  grid = new Grid(100, 100);
}

void draw() {
  background(255);
  grid.update();
  
  text(randomSeed + " " + grid.gHeight + "x" + grid.gWidth, 10, 10);
}

//Control zooming by pressing + or - buttons on keyboard. 
void keyPressed() {
  switch(key) {
    case '=':
      zoom *= 1.1;
      break;
    case '-':
      zoom /= 1.1;
      break;
  }
}

//Control zooming by scrolling (bad at low framerates)
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  
  zoom += e*1.1;
}
