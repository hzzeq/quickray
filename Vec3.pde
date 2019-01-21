// 3-component vector
class Vec3 {
  
  public float x, y, z;
  
  public Vec3() {
    this.x = 0;
    this.y = 0;
    this.z = 0;
  }
  
  public Vec3(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public double magnitude() {
    return sqrt(pow(this.x, 2) + pow(this.y, 2) + pow(this.z, 2));
  }
  
  public Vec3 normalize() {
    float m = (float) this.magnitude();
    return new Vec3(this.x / m, this.y / m, this.z / m);
  }
  
  public Vec3 negate() {
    return new Vec3(-this.x, -this.y, -this.z);
  }
  
  public color toPColor() {
    return color(constrain(this.x, 0, 1) * 255, constrain(this.y, 0, 1) * 255, constrain(this.z, 0, 1) * 255);
  }
  
  public String toString() {
    return "(" + this.x + ", " + this.y + ", " + this.z + ")"; 
  }
  
}

Vec3 vadd(Vec3 a, Vec3 b) {
  return new Vec3(a.x + b.x, a.y + b.y, a.z + b.z); 
}

Vec3 vsub(Vec3 a, Vec3 b) {
  return new Vec3(a.x - b.x, a.y - b.y, a.z - b.z); 
}

Vec3 vmult(Vec3 a, Vec3 b) {
  return new Vec3(a.x * b.x, a.y * b.y, a.z * b.z); 
}

Vec3 vmult(Vec3 a, float scalar) {
  return new Vec3(a.x * scalar, a.y * scalar, a.z * scalar); 
}

Vec3 vmult(Vec3 a, double scalar) {
  return vmult(a, (float) scalar);
}

Vec3 vreflect(Vec3 vector, Vec3 axis) {
  return vsub(vector, vmult(axis, 2.0 * vdot(vector, axis))); 
}

Vec3 vmix(Vec3 a, Vec3 b, float factor) {
  return vadd(vmult(a, factor), vmult(b, 1.0f - factor));
}

float vdot(Vec3 a, Vec3 b) {
  return a.x * b.x + a.y * b.y + a.z * b.z;
}

float vdist(Vec3 a, Vec3 b) {
  return (float) sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2) + pow(a.z - b.z, 2)); 
}
