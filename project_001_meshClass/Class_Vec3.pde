class Vec3{
float x,y,z;
Vec3(){
}

Vec3(float x, float y, float z){
  this.x = x;
  this.y = y;
  this.z = z;
}

void add(float s){
}

void add(Vec3 v){
  x += v.x;
  y += v.y;
  z += v.z;
}
void sub(Vec3 v){
  x -= v.x;
  y -= v.y;
  z -= v.z;
}

void mult(float s){
  x *= s;
  y *= s;
  z *= s;
}
void div(float s){
  x /= s;
  y /= s;
  z /= s;
}

void setTo(Vec3 v){
  x = v.x;
  y = v.y;
  z = v.z;
}


float dot(Vec3 v){
  ///calculate angle between vectors in 3d space
  return x*v.y + y*v.y + z*v.z;
}

//static float dot(Vec3 v0,Vec3 v1){
  //return v0.x*v1.x + v0.y*v1.y + v0.z*v1.z;
//}

Vec3 cross(Vec3 v){
  float _x= y*v.z - z*v.y;
  float _y= z*v.x - x*v.z;
  float _z= x*v.y - y*v.x;
  
  return new Vec3(_x, _y, _z);
}

void invert(){
  mult(-1);
}

float mag(){
  return sqrt(x*x + y*y + z*z);
}

void normalize(){
  float m = mag();
  div(m);  
}

}
