class Edge {
  float r, g, b, a;
  color col;
  Vertex vS, vE;

  Edge() {
    r = 255;
    g = 255;
    b = 255;
    a = 255;
    col = color(r, g, b, a);
  }

  Edge(Vertex v1, Vertex v2) {
    r = 255;
    g = 255;
    b = 255;
    a = 50;
    col = color(r, g, b, a);

    vS = v1;
    vE = v2;
    Vertex[] verts = new Vertex[2];
    verts [0]= vS;
    verts [1]= vE;
  }

  Edge(Vec3 v1, Vec3 v2) {
    r = 255;
    g = 255;
    b = 255;
    a = 50;
    col = color(r, g, b, a);

    vS = new Vertex(v1);
    vE = new Vertex(v2);
    Vertex[] verts = new Vertex[2];
    verts [0]= vS;
    verts [1]= vE;
  }

  void display() {
    pushStyle();
    stroke(col);
    strokeWeight(.5);
    line(vS.pos.x, vS.pos.y, vS.pos.z, vE.pos.x, vE.pos.y, vE.pos.z);
    popStyle();
  }
}

