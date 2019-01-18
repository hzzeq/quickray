Screen s;
Camera c;
Scene world;

void setup() {
  size(500, 500);
 
  frameRate(60);
 
  background(0, 0, 0);
  noStroke();
  
  s = new Screen(250);
  c = new Camera(s, new Vec3(0, 0, 0), 1);
  
  world = new Scene();
  
  //world.objects.add(new Sphere(new Vec3(-2, -2, 5), 1)); world.objects.get(0).objColor = new Vec3(1, 1, 1);
  //world.objects.add(new Sphere(new Vec3(-2, 2, 5), 1)); world.objects.get(1).objColor = new Vec3(1, 1, 1);
  //world.objects.add(new Sphere(new Vec3(3, 3, 6), 1)); world.objects.get(2).objColor = new Vec3(1, 1, 1);
  
  for(int i = 0; i < 10; i++) {
    world.objects.add(new Sphere(new Vec3(random(10) - 5, random(10) - 5, random(5) + 4), 1)); 
  }
  
  world.lights.add(new PointLight(new Vec3(3, -3, 3), new Vec3(1, 0, 0), 0.1));
  world.lights.add(new PointLight(new Vec3(-3, 3, 3), new Vec3(0, 1, 0), 0.1));
  world.lights.add(new PointLight(new Vec3(-3, 3, 3), new Vec3(0, 0, 1), 0.1));
  
}

//boolean play = true;

//void keyPressed() {
//  play = !play;
//  if (play) loop();
//  else noLoop();
//}

void draw() {
  
  world.lights.get(0).position = new Vec3(sin((float)frameCount / 20) * 3, cos((float)frameCount / 20) * 3, 3);
  world.lights.get(1).position = new Vec3(cos((float)frameCount / 20) * 3, cos((float)frameCount / 20) * 3, 3);
  
  //c.position = new Vec3(sin((float)frameCount / 20) * 0.1, cos((float)frameCount / 8) * 0.1, 0);
  
  background(0);
    
  c.render(world);
  
  s.drawPixBuf();
  
}
