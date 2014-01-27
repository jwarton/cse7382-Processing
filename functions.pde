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
  ////calculate position based on min/max vertex coordinated
  pos = new Vertex();
  pos.x = minX + ((maxX - minX)/2);
  pos.y = minY + ((maxY - minY)/2);
  pos.z = minZ + ((maxZ - minZ)/2);
  ////set position coordinates
  polygon.pos = pos;
}

void vertsToPoly() {
  Vertex currentVert;
  Vertex vertPos;

  polygon = new Poly();
  arrPolygons = (Poly[])append(arrPolygons, polygon);
  polygon.verts = new Vertex [ptCnt];
  polygon.vertexCnt = ptCnt;
  polyCnt++;
  //define position of polygon
  polyPos();
  //pass vertices from active array to Polygon object
  for (int i=0; i<ptCnt; i++) {
    currentVert = arrVerts[i];
    vertPos = new Vertex();
    vertPos.x = currentVert.x - polygon.pos.x;
    vertPos.y = currentVert.y - polygon.pos.y;
    vertPos.z = currentVert.z - polygon.pos.z;
    polygon.verts[i] = vertPos;
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
  Vertex vertPos;
  int arrLen = arrPolygons.length;
  for (int i = 0; i < arrLen; i++) {
    polygon = new Poly();
    polygon.pos = arrPolygons[i].pos;
    polygon.vertexCnt = arrPolygons[i].vertexCnt;
    polygon.verts = new Vertex [polygon.vertexCnt];

    for (int j = 0; j < polygon.vertexCnt; j++) {
      vertPos = new Vertex();
      vertPos.x = arrPolygons[i].verts[j].x;
      vertPos.y = arrPolygons[i].verts[j].y;
      vertPos.z = arrPolygons[i].verts[j].z;
      polygon.verts[j] = vertPos;
    }
    float alpha = 255 - (255/arrLen);
    polygon.doClose = arrPolygons[i].doClose;
    polygon.doFill = false;  //arrPolygons[i].doFill; //
    polygon.colFill = color(i, i, 50, 20);
    polygon.colStroke = color(i, i, 50, alpha);
    polygon.rotPoly(15); 
    polygon.scalePoly(.5); 
  
    arrPolygons = (Poly[])append(arrPolygons, polygon);
    polyCnt = arrPolygons.length;
    println(polyCnt);
  }
}

