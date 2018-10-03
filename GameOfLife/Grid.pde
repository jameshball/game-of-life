class Grid {
  boolean[][] data;
  int gHeight;
  int gWidth;

  //Contructor for the grid class. Randomly creates a grid of cells that are randomly alive or dead.
  Grid(int h, int w) {
    gHeight = h;
    gWidth = w;
    
    data = new boolean[h][w];
    
    for (int i = 0; i < h; i++) {
      for (int j = 0; j < w; j++) {
        data[i][j] = random(1) < 0.5;
      }
    }
  }
  
  //Function for rendering the current population and generating the next generation.
  void update() {
    draw();
    
    boolean[][] newData = new boolean[gHeight][gWidth];
    
    for (int i = 0; i < gHeight; i++) {
      for (int j = 0; j < gWidth; j++) {
        int count = neighbourCount(i, j);
        
        //Enforces the rules for Conway's game of life. See https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life#Rules
        if (data[i][j]) {
          if (count < 2 || count > 3) {
            newData[i][j] = false;
          }
          else {
            newData[i][j] = true;
          }
        }
        else {
          newData[i][j] = count == 3;
        }
      }
    }
    
    data = newData;
  }
  
  //This counts the number of alive neighbouring cells. This wraps around the grid, so if an index is outside the grid's range, a cell from the other side is chosen.
  int neighbourCount(int row, int col) {
    int count = 0;
    
    for (int i = row - 1; i < row + 2; i++) {
      for (int j = col - 1; j < col + 2; j++) {
        if (!(i == row && j == col)) {
          if (data[Math.floorMod(i, gHeight)][Math.floorMod(j, gWidth)]) {
            count++;
          }
        }
      }
    }
    
    return count;
  }
  
  //Draws the grid
  void draw() {
    fill(0);
    for (int i = 0; i < gHeight; i++) {
      for (int j = 0; j < gWidth; j++) {
        if (grid.data[i][j]) {
          //Takes into account the zoom level
          rect(i*zoom, j*zoom + 15, zoom, zoom);
        }
      }
    }
  }
}
