///meshClass_Beta

///global variables
Vec3 vect0, vect1, vect2;
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
  translate(250, 650, 0);
  rotateX((-PI/180)*125);
  rotateZ((-PI/180)*135); 
  rotateZ((-PI/180)*i); 

  //plot geometry
  vect0 = new Vec3(0, 0, 0);
  vect1 = new Vec3(0, 50, -200);
  vect2 = new Vec3(0, 50, 200);

  v0 = new Vertex(vect0);
  v1 = new Vertex(vect1);
  v0.display();
  //v1.display();

  e1 = new Edge(vect0, vect1);
  //e1.display();

  f1 = new Face(vect0, vect1, vect2);
  //f1.display();

  b1 = new Box(vect0, 150);
  b1.display();

  endCamera();
}


