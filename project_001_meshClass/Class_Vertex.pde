class Vertex {
  Vec3 pos;
  float r, g, b, a;
  color col;

  Vertex() {
    pos = new Vec3();
    r = 50;//180;
    g = 200;//15;
    b = 200;//55;
    a = 255;
    col = color(r, g, b, a);
  }

  Vertex(Vec3 pos) {
    this.pos = pos;
    r = 255;//180;
    g = 255;//15;
    b = 255;//55;
    a = 255;
    col = color(r, g, b, a);
  }

  Vertex(float x, float y, float z) {
    pos = new Vec3(x, y, z);
    r = 180;
    g = 15;
    b = 55;
    a = 255;
    col = color(r, g, b, a);
  }

  void display() {
    pushStyle();
    stroke(col);
    point(pos.x,pos.y,pos.z);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(col);
    sphere(1);
    popMatrix();
    popStyle();
  }
}

