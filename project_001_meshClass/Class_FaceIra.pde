class Face3 {
  Vec3 v0, v1, v2;
  
  Face3(){}
  
  Face3(Vec3 v0,Vec3 v1,Vec3 v2){
    this.v0 = v0;
    this.v1 = v1;
    this.v2 = v2;
  }
  
  Vec2 getNorm(){
    
    Vec3 t1 = new Vec3();
    t1.setTo(v1);
    t1.sub(v0);
    
    Vec3 t2 = new Vec3();
    t2.setTo(v2);
    t2.sub(v0);
    
    t0.normalize();
    t1.normalize();
 
    return = t0.cross(t1); 
  }
  
}
