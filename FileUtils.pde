void saveAsImage(File file) {
  String path = file.getAbsolutePath();
  frame.save(path);
  
  println("Exported image to \"" + path + "\"");
}

void exportWorldFile(File file) {
  String path = file.getAbsolutePath();
  
  String[] data = new String[world.objects.size() + world.lights.size()];
  int index = 0;
  
  for (PointLight l : world.lights) {
    data[index++] = "light " + l.position + " " + l.lightColor + " " + l.attenuation;
  }
  
  for (Sphere s : world.objects) {
    data[index++] = "sphere " + s.position + " " + s.objColor + " " + s.radius;
  }
  
  saveStrings(path, data);
  
  println("Exported scene file to \"" + path + "\"");
}
