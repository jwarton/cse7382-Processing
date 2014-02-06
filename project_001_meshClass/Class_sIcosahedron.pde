
class Icosa {

  float dim;           //defines size of shape based on an edge length of dim
  Vec3 pos;            //defines position based on centroid
  Vertex verts [];     //array contains all vertices
  Face faces [];       //array contains all faces

  ///default constructor
  Icosa() {
    pos = new Vec3 (0, 0, 0);
  }

  Icosa(Vec3 pos, float dim) {
    this.pos = pos;
    this.dim = dim;
    verts = new Vertex[12];

    float theta = 0;
    float phi = 0;
    float val = 360;
    int count = 1;

    verts[0] = new Vertex(pos.x, pos.y, pos.z + .5 * dim * cos(radians(0)));
    ///generate vertices
    for (int i=1; i<3; i++) {
      phi = radians(i * 60);

      for (int j=0; j<5; j++) {
        theta = radians(val- (j * 72));
        verts[count] = new Vertex(pos.x + (.5*dim) * cos(theta) * sin(phi), 
        (pos.y + (.5*dim) * sin(theta) * sin(phi)), 
        (pos.z + (.5*dim) * cos(phi)));
        count++;
      }
      val -=36;
    }
    
    verts[11] = new Vertex(pos.x, pos.y, pos.z + .5 * dim * cos(radians(180)));


    ///generate faces
    faces = new Face[20];
    faces[0] = new Face (verts[0], verts[2], verts[1]);
    faces[1] = new Face (verts[0], verts[3], verts[2]);
    faces[2] = new Face (verts[0], verts[4], verts[3]);
    faces[3] = new Face (verts[0], verts[5], verts[4]);
    faces[4] = new Face (verts[0], verts[1], verts[5]);
    faces[5] = new Face (verts[1], verts[6], verts[10]);
    faces[6] = new Face (verts[1], verts[2], verts[6]); 
    faces[7] = new Face (verts[2], verts[7], verts[6]);
    faces[8] = new Face (verts[2], verts[3], verts[7]);
    faces[9] = new Face (verts[3], verts[8], verts[7]);
    faces[10] = new Face (verts[3], verts[4], verts[8]);
    faces[11] = new Face (verts[4], verts[9], verts[8]);
    faces[12] = new Face (verts[4], verts[5], verts[9]);
    faces[13] = new Face (verts[5], verts[10], verts[9]);
    faces[14] = new Face (verts[5], verts[1], verts[10]);
    faces[15] = new Face (verts[11], verts[10], verts[6]);
    faces[16] = new Face (verts[11], verts[6], verts[7]);
    faces[17] = new Face (verts[11], verts[7], verts[8]);
    faces[18] = new Face (verts[11], verts[8], verts[9]);
    faces[19] = new Face (verts[11], verts[9], verts[10]);
  }
  void display() {    
    for (int i=0;i<faces.length;i++) {
      faces[i].display();
    }
  }
}

