void vertsToPoly() {

  arrPolygons[polyCnt] = new Poly();
  polygon = arrPolygons[polyCnt];
  polygon.verts = new Vertex [ptCnt];
  polygon.vertexCnt = ptCnt;
  polyCnt++;

  //define position of polygon
  polyPos();

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

void polyPos() {
  float x, minX, maxX;
  float y, minY, maxY;
  float z, minZ, maxZ;
  Vertex pos;
  Vertex curVert;

  curVert = arrVerts[0];
  minX = curVert.x;
  minY = curVert.y;
  minZ = curVert.z;
  maxX = curVert.x;
  maxY = curVert.y;
  maxZ = curVert.z;

  //loop throught points and find min and max 
  for (int i=0; i<ptCnt; i++) {
    curVert = arrVerts[i];
    x = curVert.x;
    y = curVert.y;
    z = curVert.z;

    if (minX > x) {
      minX = curVert.x;
    }
    if (minY > y) {
      minY = curVert.y;
    }
    if (minZ > z) {
      minZ = curVert.z;
    }
    if (maxX < x) {
      maxX = curVert.x;
    }
    if (maxY < y) {
      maxY = curVert.y;
    }
    if (maxZ < z) {
      maxZ = curVert.z;
    }
  }
  ////calculate position based on min max vertex coordinated
  pos = new Vertex();
  pos.x = minX + ((maxX - minX)/2);
  pos.y = minY + ((maxY - minY)/2);
  pos.z = minZ + ((maxZ - minZ)/2);
  ////set position coordinates
  polygon.pos = pos;
}

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

