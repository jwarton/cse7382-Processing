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
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(0, 0, 0);
    noFill();
    ellipse(0, 0, 3, 3);

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

    for (int i = 0; i < vertexCnt; i++) {
      Vertex vert = verts[i];
      ptX = vert.x;
      ptY = vert.y;
    }

    popMatrix();
  }
  void select() {
  }

  void rotPoly(float theta) {
    theta = (PI/180)*theta;
    for (int i = 0; i < vertexCnt; i++) {
      verts[i].x = (verts[i].x) * cos(theta) - (verts[i].y) * sin(theta);
      verts[i].y = (verts[i].x) * sin(theta) + (verts[i].y) * cos(theta);
    }
  }
  void scalePoly(float scaleFactor) {
    for (int i = 0; i < vertexCnt; i++) {
      verts[i].x *= scaleFactor;
      verts[i].y *= scaleFactor;
    }
  }
}

