// A base class for any renderable object
class Renderable {
  
  public boolean visible;
  public Vec3 position;
  public Vec3 objColor;
  
  public Renderable() {
    this(new Vec3(0, 0, 0), true);
  }
  
  public Renderable(Vec3 position, boolean visible) {
    this.position = position;
    this.visible = visible;
    this.objColor = new Vec3(1, 1, 1);
  }
  
}

// Perfect sphere
class Sphere extends Renderable {

  public float radius;
  
  public Sphere() {
    this(new Vec3(0, 0, 0), 1); 
  }
  
  public Sphere(Vec3 position, float radius) {
    super(position, true);
    this.radius = radius;
    this.objColor = new Vec3(1, 1, 1);
  }
  
}

// Infinite plane
class Plane extends Renderable {
  
  public Vec3 direction;
  
  public Plane() {
    this(new Vec3(0, 0, 0), new Vec3(0, 0, 0));
  }
  
  public Plane(Vec3 position, Vec3 direction) {
    this.position = position;
    this.direction = direction.normalize();
    this.objColor = new Vec3(1, 1, 1);
  }
  
}
