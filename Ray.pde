// A ray with a position and direction, used for the main tracing algorithm
class Ray {
  
  public Vec3 position;
  public Vec3 direction;
  
  public Ray() {
    this(new Vec3(0, 0, 0), new Vec3(0, 0, 0));
  }
  
  public Ray(Vec3 position, Vec3 direction) {
    this.position = position;
    this.direction = direction;
  }
  
  public Vec3 pointAt(float dist) {
    return vadd(this.position, vmult(this.direction, dist));  
  }
  
  public Hit intersect(Sphere s) {
    
    Vec3 L = vsub(s.position, this.position);
    float tca = vdot(L, this.direction);
    
    if (tca < 0) return new Hit(false, -1);
    
    float d = vdot(L, L) - (tca * tca);
    
    if (d > s.radius) return new Hit(false, -1);
    
    float thc = (float) sqrt(pow(s.radius, 2) - pow(d, 2));
    
    float enter = tca - thc;
    //float exit = tca + thc;
    
    return new Hit(true, enter);
        
  }

}

// Class with information describing a hit between the ray and an object
class Hit {
  
  public boolean hit;
  public float distance;
  
  Hit() {
    this(false, -1);
  }
  
  Hit(boolean hit, float distance) {
    this.hit = hit;
    this.distance = distance;
  }
  
}

// Traces the ray through the scene and determines the color of the point
public Vec3 trace(Scene scene, Ray r) {
  
  float nearest = Float.MAX_VALUE;
  Vec3 pixel = null;

  for (Sphere obj : scene.objects) {
    
    Hit h = r.intersect(obj);
    
    if (obj.visible && h.hit && h.distance < nearest) {
      
      nearest = h.distance;
      
      Vec3 hitpoint = r.pointAt(h.distance); // Get the hit point
      Vec3 normal = vsub(hitpoint, obj.position).normalize(); // vector from centre of sphere to point
      
      Vec3 lighting = new Vec3(0, 0, 0);
      
      for (PointLight l : scene.lights) {
        Vec3 lightdir = vsub(l.position, hitpoint).normalize(); // vector from point to light source
        
        // Cast shadow ray
        Ray shadowRay = new Ray(hitpoint, lightdir);
        // If the path between this point and the light is blocked, we skip the lighting
        if (hitTest(scene, shadowRay)) continue;
        // This results in hard shadows, soft shadows are a later problem
        
        // Calculate diffuse lighting factor
        float factor = max(vdot(normal, lightdir), 0.0);
        Vec3 diffuse = vmult(l.lightColor, factor);
        
        // Calculate attenuation (light fallof at a distance)
        // 1 / (1 + k(l - p)^2)
        double attenuation = 1.0 / (1.0 + l.attenuation * pow(vdist(l.position, hitpoint), 2));
        
        // Combine all light factors into one
        Vec3 overall = vmult(vmult(diffuse, attenuation), obj.objColor);
        
        lighting = vadd(lighting, overall);
      }
      
      pixel = lighting;
      
    }
    
  }
  
  return pixel;
  
}

// Simplified version of trace() that returns whether the ray intersected
// anything rather than calculating the color of the point that is hit
public boolean hitTest(Scene scene, Ray r) {
  
  for (Sphere obj : scene.objects)
    if(r.intersect(obj).hit) return true;
    
  return false;
  
}
