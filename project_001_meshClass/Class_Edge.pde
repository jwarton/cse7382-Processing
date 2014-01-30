class Edge {
  float sX, sY, sZ;
  float eX, eY, eZ;
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
    
    sX = vS.x;
    sY = vS.y;
    sZ = vS.z;
    eX = vE.x;
    eY = vE.y;
    eZ = vE.z;
  }

  void display() {
    pushStyle();
    stroke(col);
    strokeWeight(.5);
    line(sX, sY, sZ, eX, eY, eZ);
    popStyle();
  }
}

