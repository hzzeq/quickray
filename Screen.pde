class Screen {
  
  private int size;
  private float spacing;
  private Vec3 pixbuf[][];
  private float depthbuf[][];

  // Constructors
  public Screen() {
    this(10);
  }

  public Screen(int size) {
    this.size = size;
    this.spacing = width / this.size;
    this.pixbuf = new Vec3[this.size][this.size];
  }
  
  // Set single pixel's value
  public void setPix(int x, int y, Vec3 c) {
    this.pixbuf[x][y] = c;
  }
  
  // Renders full screen to Processing output window
  public void drawPixBuf() {
    for (int x = 0; x < this.size; x++) {
      for (int y = 0; y < this.size; y++) {
        
        if (this.pixbuf[x][y] != null) {
          
          fill(this.pixbuf[x][y].toPColor());
          rect(x * this.spacing, y * this.spacing, this.spacing, this.spacing);
          
        }
        
      }
    }
  }
  
}
