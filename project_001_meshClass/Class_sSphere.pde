class Sphere {
  Vec3 pos;
  float dim;
  float r, g, b;
  color col;
  int vCols, vRows;
  Vertex verts [];
  Face faces [];

  Sphere() {
  }

  Sphere(Vec3 pos, float dim, int resolution) {
    this.pos = pos;
    this.dim = dim;
    vCols = resolution*2;
    vRows = resolution;
    float phi = 0;
    float theta = 0;

    verts = new Vertex [0];

    for (int i=0; i<vCols; i++) {
      for (int j=0; j<vRows; j++) {
        theta = (2*PI/vCols)*(i+1);
        phi = (PI/vRows)*(j);

        Vertex vertex = new Vertex(
        pos.x +(cos(theta) * sin(phi) * dim), 
        pos.y +(sin(theta) * sin(phi) * dim), 
        pos.z +(cos(phi) * dim));
        verts = (Vertex[])append(verts, vertex);
      }
    }
    ///generate faces from vertices
    faces = new Face [0];
    for (int i=0;i<(verts.length-vRows) ;i++) {
      if (i>0) {
        int val0 = i;
        int val1 = i-1;
        int val2 = (i-1) + vRows;
        int val3 = (i) + vRows;
        
        Face faceA = new Face (verts[val0], verts[val2], verts[val1]);
        faceA.col= color(i,i,i,255);                                       ///black to white faces
        faces = (Face[])append(faces, faceA);
        
        //if (i>vRows) { // & i<(verts.length-(2*vRows))
          Face faceB = new Face (verts[val3], verts[val2], verts[val0]);
          faceB.col= color(255-i,255,i,255);                              ///yellow-cyan faces
          faces = (Face[])append(faces, faceB);
        //}
      }
    }
  }

  void display() {  
    for (int i=0;i<faces.length;i++) {
      faces[i].display();
    }
  }
}

