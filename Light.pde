// Every light has a position and a color at the least
class BaseLight {
  
  public Vec3 position;
  public Vec3 lightColor;
  
  public BaseLight() {
    this(new Vec3(0, 0, 0), new Vec3(1, 1, 1));
  }
  
  public BaseLight(Vec3 position, Vec3 lightColor) {
    this.position = position;
    this.lightColor = lightColor;
  }
  
}

// Single light source emitting in all directions
class PointLight extends BaseLight {
  
  public float attenuation;
  
  public PointLight() {
    this(new Vec3(0, 0, 0), new Vec3(1, 1, 1), 0.1);
  }
  
  public PointLight(Vec3 position, Vec3 lightColor, float attenuation) {
    super(position, lightColor);
    this.attenuation = attenuation;
  }
  
}

// Distant light source that comes from one direction (like the sun)
class DirectionLight extends BaseLight {
  
  public Vec3 direction;
  
  public DirectionLight() {
    this(new Vec3(0, 0, 0), new Vec3(1, 1, 1), new Vec3(0, 1, 0));
  }
  
  public DirectionLight(Vec3 position, Vec3 lightColor, Vec3 direction) {
    super(position, lightColor);
    this.direction = direction;
  }
  
}
