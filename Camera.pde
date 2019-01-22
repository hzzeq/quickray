// The point of view of the window, manages rendering to the screen
class Camera {
  
  public Vec3 position;
  public float far;
  
  public Camera(Vec3 position, float far) {
    this.position = position;
    this.far = far; // 1 / tan(2 * fov);
  }

  public PImage renderImage(Scene scene, int imageWidth, int imageHeight) {
    
    PImage output = createImage(imageWidth, imageHeight, RGB);
    
    for (int x = 0; x < output.width; x++) {
      for (int y = 0; y < output.height; y++) {
        
        output.set(x, y, new Vec3(0, 0, 0).toPColor());
        
        Vec3 world = this.gridToWorld(x, y, imageWidth, imageHeight);
        
        Vec3 direction = new Vec3(this.position.x + world.x, this.position.y + world.y, world.z);
        Ray r = new Ray(this.position, direction.normalize());
        
        output.set(x, y, trace(scene, r).toPColor());
        
      }
    }
    
    return output;
    
  }
  
  private Vec3 gridToWorld(int x, int y, int imageWidth, int imageHeight) {
    
    // We add the 0.5 offset so the ray is sent through the
    // middle of the pixel rather than the top corner
    float nx = (x + 0.5) / imageWidth;
    float ny = (y + 0.5) / imageHeight;
    
    // Converting to coordinates in the "world"
    float wx = (2 * nx) - 1;
    float wy = -(2 * ny) + 1;
    float wz = this.far;
    
    return new Vec3(wx, wy, wz);
    
  }
  
}
