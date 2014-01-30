class Vertex {
  float x, y, z;
  float r, g, b, a;
  color col;

  Vertex() {
    r = 180;
    g = 15;
    b = 55;
    a = 255;
    col = color(r, g, b, a);
  }

  Vertex(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;

    r = 180;
    g = 15;
    b = 55;
    a = 255;
    col = color(r, g, b, a);
  }

  void display() {
    pushStyle();
    stroke(col);
    //point(x,y,z);
    pushMatrix();
    translate(x, y, z);
    fill(col);
    sphere(1);
    popMatrix();
    popStyle();
  }
  
}

