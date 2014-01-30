class Normal {
  float r, g, b, a;
  color col;
  float x1, y1, z1;
  float magnitude;
  Vertex ptS, ptE;


  Normal() {
    r = 255;
    g = 255;
    b = 255;
    a = 255;
    col = color(r, g, b, a);
  }

  Normal(Vertex ptS) {
    r = 255;
    g = 255;
    b = 255;
    a = 255;
    col = color(r, g, b, a);
    this.ptS = ptS;
    magnitude = 10;
  }
  
    Normal(Vertex ptS, Vertex v1, Vertex v2, Vertex v3) {
    r = 255;
    g = 255;
    b = 255;
    a = 255;
    col = color(r, g, b, a);
    this.ptS = ptS;
    
    //////cross product of v1,v2,v3 + magnitude
    //ptE = 
    
    //magnitude = 10;
  }

  void display() {
    pushStyle();
    pushMatrix();
    strokeWeight(1);
    stroke(col);
    line(ptS.pos.x,ptS.pos.y,ptS.pos.z,ptE.pos.x,ptE.pos.y,ptE.pos.z);    
    popMatrix();
    popStyle();
  }
}

