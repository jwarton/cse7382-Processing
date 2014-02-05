class Tetra {
  float dim;           //defines size 
  Vec3 pos;            //defines position
  Vertex verts [];     //array contains all vertices
  Face faces [];       //array contains all faces

  ///default constructor
  Tetra() {
    pos = new Vec3 (0, 0, 0);
  }

  Tetra(Vec3 pos, float dim) {
    this.pos = pos;
    this.dim = dim;
    verts = new Vertex[4];

    verts[0] = new Vertex (pos.x, pos.y, pos.z+(dim*.5));

    for (int i = 0; i<3; i++) {
      float theta = radians(i*120);
      verts[i+1] = new Vertex ((pos.x+(dim*.5 * cos(theta))), 
      (pos.y+(dim*.5 * sin(theta))), 
      (pos.z-(dim*.5)));
    }

    faces = new Face[4];
    faces[0] = new Face (verts[0], verts[1], verts[2]);
    faces[1] = new Face (verts[0], verts[2], verts[3]);
    faces[2] = new Face (verts[0], verts[3], verts[1]);
    faces[3] = new Face (verts[1], verts[3], verts[2]);
  }
  void display() {    
    for (int i=0;i<faces.length;i++) {
      faces[i].display();
    }
  }
}

