class Matrix4x4 {
  float 1a, 1b, 1c, 1d;
  float 2a, 2b, 2c, 2d;
  float 3a, 3b, 3c, 3d;
  float 4a, 4b, 4c, 4d;
  float x, y, z, w;
  Vec3 vector;

  Matrix4x4() {
    1a = 1;
    1b = 0;
    1c = 0;
    1d = 0;

    2a = 0;
    2b = 1;
    2c = 0;
    2d = 0;

    3a = 0;
    3b = 0;
    3c = 1;
    3d = 0;

    4a = 0;
    4b = 0;
    4c = 0;
    4d = 1;

    w = 1;
  }

  Matrix4x4(Vec3 vector) {
    this.vector = vector;
    1a = 1;
    1b = 0;
    1c = 0;
    1d = 0;

    2a = 0;
    2b = 1;
    2c = 0;
    2d = 0;

    3a = 0;
    3b = 0;
    3c = 1;
    3d = 0;

    4a = 0;
    4b = 0;
    4c = 0;
    4d = 1;

    x = vector.x;
    y = vector.y;
    z = vector.z;
    w = 1;
  }

  void mTranslate(Vec3 delta) {
    1d = delta.x;
    2d = delta.y;
    3d = delta.z;
    run();
  }

  void mRotateX(float theta) {
    2b = cos(theta);
    2c = sin(theta);
    3b = sin(theta);
    3c = cos(theta);
    run();
  }

  void mRotateY(float theta) {
    1a = cos(theta);
    1c = sin(theta);
    3a = sin(theta);
    3c = cos(theta);
    run();
  }

  void mRotateZ(float theta) {
    1a = cos(theta);
    1b = sin(theta);
    2a = sin(theta);
    2c = cos(theta);
    run();
  }

  void mScale3d(float scaleFx) {
    1a = scaleFx;
    2b = scaleFx;
    3c = scaleFx;
    run();
  }

  void mScale2d(float scaleFx, Vec3 axis) {
  }
  void mScale1d(float scaleFx, Vec3 axis) {
  }

  void run() {
    vector.x = (1a*x)+(1b*y)+(1c*z)+(1d*w);
    vector.y = (2a*x)+(2b*y)+(2c*z)+(2d*w);
    vector.z = (3a*x)+(3b*y)+(3c*z)+(3d*w);
  }
}

