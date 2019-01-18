// The point of view of the window, manages rendering to the screen
class Camera {
  
  public Screen output;
  public Vec3 position;
  public float far;
  
  public Camera(Screen output, Vec3 position, float far) {
    this.output = output;
    this.position = position;
    this.far = far; // 1 / tan(2 * fov);
  }
  
  public void render(Scene scene) {
    
    for (int x = 0; x < this.output.size; x++) {
      for (int y = 0; y < this.output.size; y++) {
        
        this.output.setPix(x, y, new Vec3(0, 0, 0));
        
        Vec3 world = this.gridToWorld(x, y);
        
        Vec3 direction = new Vec3(this.position.x + world.x, this.position.y + world.y, world.z);
        Ray r = new Ray(this.position, direction.normalize());
        
        this.output.setPix(x, y, trace(scene, r));
        
        // Temporary
        for (PointLight obj : scene.lights) {
          Hit h = r.intersect(new Sphere(obj.position, 0.01));
          if (h.hit) this.output.setPix(x, y, obj.lightColor);
        }
        
      }
    }
    
  }
  
  private Vec3 gridToWorld(int x, int y) {
    
    // We add the 0.5 offset so the ray is sent through the
    // middle of the pixel rather than the top corner
    float nx = (x + 0.5) / this.output.size;
    float ny = (y + 0.5) / this.output.size;
    
    // Converting to coordinates in the "world"
    float wx = (2 * nx) - 1;
    float wy = -(2 * ny) + 1;
    float wz = this.far;
    
    return new Vec3(wx, wy, wz);
    
  }
  
}
