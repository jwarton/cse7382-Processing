class Box {
  float dim;
  Vec3 pos;
  Vertex verts [];
  Face faces [];

  Box() {
    pos = new Vec3 (0,0,0);
  }

  Box(Vec3 pos, float dim) {   
    this.pos = pos;
    this.dim = dim; 
    verts = new Vertex[8];

    verts[0] = new Vertex ((pos.x-(dim*.5)), (pos.y+(dim*.5)), (pos.z+(dim*.5)));
    verts[1] = new Vertex ((pos.x-(dim*.5)), (pos.y-(dim*.5)), (pos.z+(dim*.5)));
    verts[2] = new Vertex ((pos.x+(dim*.5)), (pos.y-(dim*.5)), (pos.z+(dim*.5)));
    verts[3] = new Vertex ((pos.x+(dim*.5)), (pos.y+(dim*.5)), (pos.z+(dim*.5)));
    verts[4] = new Vertex ((pos.x-(dim*.5)), (pos.y+(dim*.5)), (pos.z-(dim*.5)));
    verts[5] = new Vertex ((pos.x-(dim*.5)), (pos.y-(dim*.5)), (pos.z-(dim*.5)));
    verts[6] = new Vertex ((pos.x+(dim*.5)), (pos.y-(dim*.5)), (pos.z-(dim*.5)));
    verts[7] = new Vertex ((pos.x+(dim*.5)), (pos.y+(dim*.5)), (pos.z-(dim*.5)));

    faces = new Face[12];
    faces[0] = new Face (verts[0],verts[1],verts[3]);
    faces[1] = new Face (verts[2],verts[3],verts[1]);  
    faces[2] = new Face (verts[3],verts[2],verts[7]);  //confirm right hand rule
    faces[3] = new Face (verts[6],verts[7],verts[2]);  //confirm right hand rule
    faces[4] = new Face (verts[3],verts[7],verts[4]);
    faces[5] = new Face (verts[4],verts[0],verts[3]);
    faces[6] = new Face (verts[0],verts[4],verts[5]);
    faces[7] = new Face (verts[5],verts[0],verts[1]);
    faces[8] = new Face (verts[1],verts[5],verts[6]);  //confirm right hand rule
    faces[9] = new Face (verts[2],verts[6],verts[1]);  //confirm right hand rule
    faces[10] = new Face (verts[6],verts[4],verts[7]);
    faces[11] = new Face (verts[6],verts[5],verts[4]);
    
    //faces[0].col = color(255,0,0,255);
    //faces[1].col = color(255,255,0,255);
  }

  void display() {    
    for (int i=0;i<faces.length;i++) {
      faces[i].display();
    }
  }
}

