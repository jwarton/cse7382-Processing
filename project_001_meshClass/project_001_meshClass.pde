///meshClass_Beta

///global variables
Vec3 vect0, vect1, vect2, pos;
Vertex v0, v1, v2, v3;
Edge e1;
Face f1;
Box b1, bTemp;
int i;
color col;

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


  Matrix4x4 m0 = new Matrix4x4(vect0);
  m0.mTranslate(vect1);
  m0.mRotateX(90);

  b1 = new Box(vect0, 150);
  b1.display();
  
  col = color(250,250,250,50);
  //add array to store boxes positioned to face normals
  for (int i = 0; i < b1.faces.length; i++) {
    pushMatrix();
    pos = new Vec3(b1.faces[i].n0.vec.x, b1.faces[i].n0.vec.y, b1.faces[i].n0.vec.z);
    translate(pos.x, pos.y, pos.z);
    //fill(col);
    noFill();
    stroke(col);
    box(8);
    //sphere(3);
    //bTemp = new Box(pos,10);
    //bTemp.display();
    popMatrix();
  }
  
  endCamera();
}

