///meshClass_Beta

///global variables
Vec3 n0, n1, n;
Vertex v0, v1, v2, v3;
Edge e1;
Face f1;
Box b1;
int i;

void setup() {
  size(500, 1020, P3D);
  background(0, 0, 0);
  noFill();
  i=0;
}
void draw() {
  background(0, 0, 0);
  i++;
  beginCamera();
  camera();
  
  //translate origin to center of stage
  translate(250, 650,0);
  rotateX((-PI/180)*125);
  //rotateZ((-PI/180)*135); 
  rotateZ((-PI/180)*i); 
  
  ///In class example of Vec3 class
  //n0 = new Vec3(0, 0, 0);
  //n1 = new Vec3(225, -50, -25);
  //Vec3 t0 = new Vec3();
  //t0.setTo(n0);
  //Vec3 t1 = new Vec3();
  //t1.setTo(n1);
  //t0.normalize();
  //t1.normalize();
  //n = t0.cross(t1);  
  
  //plot geometry
  v0 = new Vertex();
  v0.x = 0;
  v0.y = 0;
  v0.z = -200;
  v1 = new Vertex();
  v1.x = 0;
  v1.y = 0;
  v1.z = 0;
  v2 = new Vertex();
  v2.x = 100;
  v2.y = 0;
  v2.z = 0;
  v3 = new Vertex();
  v3.x = 0;
  v3.y = 100;
  v3.z = 0;

  v0.display();

  e1 = new Edge(v0, v1);
  //e1.display();
  
  f1 = new Face(v1, v2, v3);
  //f1.display();
  
  b1 = new Box(v0, 150);
  b1.display();
  
  endCamera();
}



