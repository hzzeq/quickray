// Class containing all the objects in the scene
class Scene {
  
  public ArrayList<PointLight> lights;
  public ArrayList<Sphere> objects;
  
  public Scene() {
    this.lights = new ArrayList<PointLight>();
    this.objects = new ArrayList<Sphere>();
  }

}
