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

  Sphere(Vec3 pos, float dim, int U, int V) {
    this.pos = pos;
    this.dim = dim;
    vCols = U;
    vRows = V;
    float phi = 0;
    float theta = 0;

    verts = new Vertex [0];

    for (int i=0; i<vRows+1; i++) {
      for (int j=0; j<vCols; j++) {
        theta =(2*PI/vCols)*(j);
        phi = (PI/vRows)*(i);

        Vertex vertex = new Vertex(
        pos.x +(cos(theta) * sin(phi) * dim), 
        pos.y +(sin(theta) * sin(phi) * dim), 
        pos.z +(cos(phi) * dim));
        verts = (Vertex[])append(verts, vertex);
      }
    }
    ///generate faces from vertices
    faces = new Face [0];
    for (int i=0;i<(verts.length-(vCols)) ;i++) {
      if (i>0) {
        int val0 = i;
        int val1 = i-1;
        int val2 = i-1 + vCols;
        int val3 = i + vCols;

        Face faceA = new Face (verts[val0], verts[val1], verts[val2]);
        Face faceB = new Face (verts[val0], verts[val2], verts[val3]);

        if ((i<(vCols))||(i>verts.length-(2*vCols))) {
          faceA.col= color(55, 255-i, 255-i, 255);                              ///yellow-cyan faces
          faceB.col= color(255-i, 0, i, 255);
        } 
        else {
          faceA.col= color(i, i, i, 255);                                    ///black to white faces
          faceB.col= color(i, i, i, 255);
        }
        if(i==vCols){
          faceA.col= color(255, 255, 255, 255);
          faceB.col= color(0, 255, 255, 255);
        }
        
        if (i>verts.length-(2*vCols)) {
          faces = (Face[])append(faces, faceA);
        } 
        else {
          if (i<(vCols)) {
            faces = (Face[])append(faces, faceB);
          } else {
            faces = (Face[])append(faces, faceA);
            faces = (Face[])append(faces, faceB);
          }
        }
      }
    }
  }

  void display() {  
    for (int i=0;i<verts.length;i++) {
      verts[i].display();
    }
    for (int i=0;i<faces.length;i++) {
      faces[i].display();
    }
  }
}

