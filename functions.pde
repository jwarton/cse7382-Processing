void vertsToPoly() {

  arrPolygons[polyCnt] = new Poly();
  polygon = arrPolygons[polyCnt];
  polygon.verts = new Vertex [ptCnt];
  polygon.vertexCnt = ptCnt;
  polyCnt++;
  
  //define position of polygon
  polygon.pos = arrVerts[0];
  
  //pass vertices from active array to Polygon object
  for (int i=0; i<ptCnt; i++) {
    polygon.verts[i] = arrVerts[i];
  }
  if (closed == true) {
    polygon.doFill = true;
  } 
  else {
    polygon.doFill = false;
  }
  closed = false;
  doPoly = false;
  ptCnt = 0;
};

void polyProp() {
  int val = polyCnt;
  //pushMatrix();
  //translate(50, 50);
  for (int i = 0; i < val; i++) {
    arrPolygons[polyCnt] = arrPolygons[i];
    arrPolygons[polyCnt].colFill = color(i, i, 50, 20);
    int vertCnt0 =  arrPolygons[polyCnt].vertexCnt;
    for (int j = 0; j < vertCnt0; j++) {
      arrPolygons[i].verts[j].x = arrPolygons[polyCnt].verts[j].x-5;
      arrPolygons[i].verts[j].y = arrPolygons[polyCnt].verts[j].y-25;
    }
    polyCnt++;
  }
  //popMatrix();
}

