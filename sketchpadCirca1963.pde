//sketchpad circa 1963
//1.  draw/plot 2d closed or open shapes with orthographic line toggle
//2.  drag, scale and rotate shapes
//3.  copy delete shapes
//4.  creative extras [recursive echo]

/// global variable
float ptSx, ptSy;
float ptEx, ptEy;
float ptX, ptY;
float snap, snapDist;
int ptCnt, polyCnt;
boolean ortho, closed;
boolean doPoly;
float[] vertex;
Poly polygon;
Poly[] arrPolygons ={};
//Poly[] arrPolygons;
Vertex vert;
Vertex vertNear;
Vertex[] arrVerts;

void setup() {
  size(500, 800);
  background(255, 255, 255);
  ptCnt = 0;
  polyCnt =0;
  ortho = false;
  closed = false;
  doPoly = false;
  vertex = new float[2];
  snapDist = 25;
  //arrPolygons = new Poly[5000];

  stroke(0, 0, 0, 100);
  noFill();
}

void draw() {
  background(255, 255, 255);

  fill(220, 15, 50);
  if (keyPressed == true) {
    if (key == CODED) {
      if (keyCode == SHIFT) {
        ortho = true;
      }
    }
  } 
  else {
    ortho = false;
  }
  ///draw polgons from array of stored objects
  if (polyCnt > 0) {
    for (int i = 0; i < arrPolygons.length; i++) {  
      polygon = arrPolygons[i];
      polygon.display();
    }
  }
  ///if ortho is true set end point otrhographic to prev vertex 
  ///else draw end point based on position of mouse
  if (doPoly == true) {
    if (ortho == true) {
      if (abs(mouseX-vertex[0]) < abs(mouseY-vertex[1])) {
        ptEx = vertex[0];
        ptEy = mouseY;
      } 
      else { 
        ptEx = mouseX;
        ptEy = vertex[1];
      }
    } 
    else {
      ptEx = mouseX;
      ptEy = mouseY;
    }
    ///if cursor is near previous vertex set vertext to end point
    if (ptCnt > 2) {
      snap = dist(ptSx, ptSy, ptEx, ptEy);
      if (snap < snapDist) {
        ptEx = ptSx;
        ptEy = ptSy;
        closed = true;
      } 
      else {
        closed = false;
      }
    }
    ///draw line based on previous vertex and current mouse position
    pushStyle();
    stroke(0, 150, 150, 100);
    line(vertex[0], vertex[1], ptEx, ptEy);
    popStyle();
  }
  ///draw polgon from array of stored vertices
  if (ptCnt > 1) {
    pushStyle();
    noFill();
    beginShape();
    stroke(150, 150, 150);
    for (int i = 0; i< ptCnt; i++) {
      vert = arrVerts[i];
      ptX = vert.x;
      ptY = vert.y;
      vertex(ptX, ptY);
    }
    endShape();
    popStyle();
  }
}

void mouseReleased() {
}
void mousePressed() {
  ///create array of vertices to hold active vertex sequence
  if (doPoly == false) {
    doPoly = true;
    arrVerts = new Vertex [1000];
    //Vertex[]arrVerts = {};
    vertex[0] = mouseX;
    vertex[1] = mouseY;
    ptSx = vertex[0] ;
    ptSy = vertex[1] ;
  } 
  else {
    vertex[0] = ptEx;
    vertex[1] = ptEy;
  }
  ///add new point to array of vetices
  vert = new Vertex();
  vert.x = vertex[0];
  vert.y = vertex[1];
  ptCnt++;
  arrVerts[ptCnt-1] = vert;
  //arrVerts = (Vertex[])append(arrVerts,vert);
  if (closed == true) {
    vertsToPoly();
    if (polyCnt > 1) {
      // function to propogate previous polys
      polyProp();
    }
  }
}

void keyReleased () {
  if (keyCode == ENTER) {    
    vertsToPoly();
  }
}

