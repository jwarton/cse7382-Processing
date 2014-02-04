class Matrix4x4 {
  float a1, b1, c1, d1;
  float a2, b2, c2, d2;
  float a3, b3, c3, d3;
  float a4, b4, c4, d4;
  float x, y, z, w;
  Vec3 vector;
  Matrix4x4() {
    a1 = 1;
    b1 = 0;
    c1 = 0;
    d1 = 0;

    a2 = 0;
    b2 = 1;
    c2 = 0;
    d2 = 0;

    a3 = 0;
    b3 = 0;
    c3 = 1;
    d3 = 0;

    a4 = 0;
    b4 = 0;
    c4 = 0;
    d4 = 1;

    w = 1;
  }
  Matrix4x4(Vec3 vector) {
    this.vector = vector;
    a1 = 1;
    b1 = 0;
    c1 = 0;
    d1 = 0;

    a2 = 0;
    b2 = 1;
    c2 = 0;
    d2 = 0;

    a3 = 0;
    b3 = 0;
    c3 = 1;
    d3 = 0;

    a4 = 0;
    b4 = 0;
    c4 = 0;
    d4 = 1;

    x = vector.x;
    y = vector.y;
    z = vector.z;
    w = 1;
  }
  void mTranslate(Vec3 delta) {
    d1 = delta.x;
    d2 = delta.y;
    d3 = delta.z;
    run();
  }
  void mRotateX(float theta) {
    b2 = cos(theta);
    c2 = sin(theta);
    b3 = sin(theta);
    c3 = cos(theta);
    run();
  }
  void mRotateY(float theta) {
    a1 = cos(theta);
    c1 = sin(theta);
    a3 = sin(theta);
    c3 = cos(theta);
    run();
  }
  void mRotateZ(float theta) {
    a1 = cos(theta);
    b1 = sin(theta);
    a2 = sin(theta);
    c2 = cos(theta);
    run();
  }
  void mScale3d(float scaleFx) {
    a1 = scaleFx;
    b2 = scaleFx;
    c3 = scaleFx;
    run();
  }
  void mScale2d(float scaleFx, Vec3 axis) {
  }
  void mScale1d(float scaleFx, Vec3 axis) {
  }
  void run() {
    vector.x = (a1*x)+(b1*y)+(c1*z)+(d1*w);
    vector.y = (a2*x)+(b2*y)+(c2*z)+(d2*w);
    vector.z = (a3*x)+(b3*y)+(c3*z)+(d3*w);
  }
}

