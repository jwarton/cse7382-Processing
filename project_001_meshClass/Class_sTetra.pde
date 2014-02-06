class Tetra {
  float dim;           //defines size of shape based on an edge length of dim
  Vec3 pos;            //defines position based on centroid
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

    ///calculate area of base
    float area = (((sqrt(3))/4) * sq(dim));
    ///calculate distance of vertex from face centroid
    float radius = (1/sqrt(3))*dim;
    ///calculate height of shape
    float h = ((sqrt(6)/3)* dim);
    
    ///generate peak vetex
    verts[0] = new Vertex (pos.x, pos.y, pos.z+(.75*h));
    ///generate base vertices
    for (int i = 0; i<3; i++) {
      float theta = radians(i*120);
      verts[i+1] = new Vertex ((pos.x+(radius * cos(theta))), 
      (pos.y+(radius * sin(theta))), 
      pos.z-(h/4));
    }
    ///generate faces
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

