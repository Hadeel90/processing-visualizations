color navy, orange;
float cx, cy;
float theta, slice;
int radius, radius1, radius2, radius3, radiusOffset, count, numOfCircles;
float [][] x, y;
float [][] c1X, c1Y, c2X, c2Y;

void setup() {
  size(500, 500);
  navy = color(0, 0, 60);
  orange = color(255, 80, 83);
  background(navy);

  cx = width/2;
  cy = height/2;
  translate(cx, cy);

  theta = 0;
  count = 30;
  numOfCircles = 7;

  x = new float[numOfCircles][count];
  y = new float[numOfCircles][count];

  c1X = new float[numOfCircles][count];
  c1Y = new float[numOfCircles][count];
  c2X = new float[numOfCircles][count];
  c2Y = new float[numOfCircles][count];

  radiusOffset = 30;
  radius = 80;
  radius1 = radius;
  radius2 = radius + 10;
  radius3 = radius + 20;
  slice = TWO_PI/count;

  addDataPointsToArray(radius, radius1, radius2, radius3);

  fill(orange, 50);
  noStroke();

  for (int j = 0; j < numOfCircles; j++) {
    beginShape();
    for (int i = 0; i < count; i++) {
      vertex(x[j][i], y[j][i]);
    }
    endShape();
  }

  //GUIDE POINTS
  //for (int j = 0; j < numOfCircles; j++) {
  //  for (int i = 0; i < count; i++) {
  //    stroke(255, 100);
  //    noFill();
  //    ellipse(x[j][i], y[j][i], 4, 4);
  //    ellipse(c1X[j][i], c1Y[j][i], 1, 1);
  //  }
  //}
}

void draw() {
}

void drawGuides(int r1, int r2, int r3) {
  pushStyle();
  noFill();
  stroke(255, 60);
  ellipse(0, 0, r1*2, r1*2);
  stroke(255, 90);
  ellipse(0, 0, r2*2, r2*2);
  stroke(255, 120);
  ellipse(0, 0, r3*2, r3*2);
  popStyle();
}

void addDataPointsToArray(int r, int r1, int r2, int r3) {
  for (int j = 0; j < numOfCircles; j++) {
    for (int i = 0; i < count; i++) {
      int toggle = int(random(3));
      if (toggle == 2) {
        r = r3;
      } else if (toggle == 1) {
        r = r2;
      } else {
        r = r1;
      }
      theta = i * (slice);
      x[j][i] = cos(theta) * r;
      y[j][i] = sin(theta) * r;
    }
    //drawGuides(r1, r2, r3);
    r1 += radiusOffset;
    r2 += radiusOffset;
    r3 += radiusOffset;
  }
}