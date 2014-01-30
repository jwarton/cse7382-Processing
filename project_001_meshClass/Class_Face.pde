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
    cent.x = (v1.x + v2.x + v3.x)/3;
    cent.y = (v1.y + v2.y + v3.y)/3;
    cent.z = (v1.z + v2.z + v3.z)/3;
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
    norm = new Normal(cent,v1,v2,v3);
  }

  void display() {
    /////////////////////////////////////    face
    pushStyle();
    noStroke();
    fill(col);
    //noFill();
    beginShape();
    vertex(v1.x, v1.y, v1.z);
    vertex(v2.x, v2.y, v2.z);
    vertex(v3.x, v3.y, v3.z);
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

