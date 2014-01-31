class Normal {
  float r, g, b, a;
  color col;
  float mag;
  Vec3 pos;
  Vec3 vec;
  //Vec3 ptE;

  Normal() {
  }

  Normal(Vec3 pos,Vec3 vec,float mag) {
    r = 235;
    g = 195;
    b = 55;
    a = 105;
    col = color(r, g, b, a);
    this.pos = pos;
    this.vec = vec;
    this.mag = mag;
    
    vec.mult(mag);            ///multiply vector components by factor | scales vector length
    Vec3 v0 = new Vec3();     ///temporary vector
      v0.setTo(vec);          ///set values in temporary vector to vector normal
    v0.add(pos);              ///moves point according to direction and length vector
    vec.setTo(v0);
  }
  
  float lenNorm(){
    Vec3 t1 = new Vec3();
    t1.setTo(pos);
    vec.sub(t1);
    return t1.mag();
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

