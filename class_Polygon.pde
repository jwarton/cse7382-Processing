class Vertex {
  float x, y, z;
}

class Poly {
  Vertex pos;
  int vertexCnt;
  Vertex[] verts;
  boolean doClose;
  boolean doFill;
  color colFill;
  color colStroke;

  Poly() {
    colFill = color(15, 15, 50, 20);
    colStroke = color(50, 120, 180);
  }

  void display() {
    pushStyle();
    if (doFill == true) {
      fill(colFill);
    } 
    else {
      noFill();
    }
    stroke(colStroke);
    beginShape();
    for (int i = 0; i < vertexCnt; i++) {
      Vertex vert = verts[i];
      ptX = vert.x;
      ptY = vert.y;
      vertex(ptX, ptY);
    }
    endShape();
    popStyle();
    stroke(255,0,0);
    ellipse(pos.x,pos.y,5,5);
    
  }
  void select() {
    
    
    
  }
}

