class Face {
  float r, g, b, a;
  color col;
  Vertex v1, v2, v3;
  Vertex verts [];
  Edge e1, e2, e3;
  Edge edges [];
  Vertex cent;
  Normal norm; 

  Face() {
    r = 55;
    g = 15;
    b = 220;
    a = 50;
    col = color(r, g, b, a);
  }

  Face(Vertex v1, Vertex v2, Vertex v3) {
    this.v1 = v1;
    this.v2 = v2;
    this.v3 = v3;    

    ///set default face color
    r = 180;
    g = 15;
    b = 55;
    a = 10;
    col = color(r, g, b, a);

    Vertex[] verts = new Vertex[3];
    verts[0] = v1;
    verts[1] = v2;
    verts[2] = v3;

    cent = new Vertex();
    cent.pos.x = (v1.pos.x + v2.pos.x + v3.pos.x)/3;
    cent.pos.y = (v1.pos.y + v2.pos.y + v3.pos.y)/3;
    cent.pos.z = (v1.pos.z + v2.pos.z + v3.pos.z)/3;
    cent.col = color(100, 100, 100, 50);

    //initialize new edges
    e1 = new Edge(v1, v2);
    e2 = new Edge(v2, v3);
    e3 = new Edge(v3, v1);

    ////store edges by reference;
    Edge[] edges = new Edge[3];
    edges[0] = e1;
    edges[1] = e2;
    edges[2] = e3;

    ////store normals by reference;
    norm = new Normal(cent, v1, v2, v3);
  }
  
  Face(Vec3 pt1, Vec3 pt2, Vec3 pt3) {
    ///set default face color
    r = 180;
    g = 15;
    b = 55;
    a = 10;
    col = color(r, g, b, a);
    
    v1 = new Vertex(pt1);
    v2 = new Vertex(pt2);
    v3 = new Vertex(pt3);    

    Vertex[] verts = new Vertex[3];
    verts[0] = v1;
    verts[1] = v2;
    verts[2] = v3;

    cent = new Vertex();
    cent.pos.x = (v1.pos.x + v2.pos.x + v3.pos.x)/3;
    cent.pos.y = (v1.pos.y + v2.pos.y + v3.pos.y)/3;
    cent.pos.z = (v1.pos.z + v2.pos.z + v3.pos.z)/3;
    cent.col = color(100, 100, 100, 50);

    //initialize new edges
    e1 = new Edge(v1, v2);
    e2 = new Edge(v2, v3);
    e3 = new Edge(v3, v1);

    ////store edges by reference;
    Edge[] edges = new Edge[3];
    edges[0] = e1;
    edges[1] = e2;
    edges[2] = e3;

    ////store normals by reference;
    norm = new Normal(cent, v1, v2, v3);
  }

  void display() {
    /////////////////////////////////////    face
    pushStyle();
    noStroke();
    fill(col);
    //noFill();
    beginShape();
    vertex(v1.pos.x, v1.pos.y, v1.pos.z);
    vertex(v2.pos.x, v2.pos.y, v2.pos.z);
    vertex(v3.pos.x, v3.pos.y, v3.pos.z);
    endShape();
    popStyle();
    /////////////////////////////////////    edges
    e1.display();
    e2.display();
    e3.display();
    /////////////////////////////////////    vertices
    v1.display();
    v2.display();
    v3.display();
    /////////////////////////////////////    centroid
    cent.display();
    /////////////////////////////////////    normals
    //n1.display();
    //n2.display();
    //n3.display();
  }
}

