class Normal {
  float r, g, b, a;
  color col;
  float mag;
  Vec3 pos;
  Vec3 vec;

  Normal() {
  }

  Normal(Vec3 pos,Vec3 vec,float mag) {
    r = 255;
    g = 255;
    b = 255;
    a = 255;
    col = color(r, g, b, a);
    this.pos = pos;
    this.vec = vec;
    this.mag = mag;
    
    vec.add(pos);
    vec.mult(mag);
    ///mag equals length of vector with out scaling
    //mag = sqrt(sq(vec.x)+sq(vec.y)+sq(vec.z));    
  }
    
  void display() {
    pushStyle();
    pushMatrix();
    strokeWeight(1);
    stroke(col);
    line(pos.x, pos.y, pos.z, vec.x, vec.y, vec.z);    
    popMatrix();
    popStyle();
  }
}

