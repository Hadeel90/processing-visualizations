color navy, orange;
float cx, cy;
float theta, slice;
int radius, radius1, radius2, radius3, radiusOffset, count, numOfCircles;
float [][] x, y;

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

  radiusOffset = 30;
  radius = 30;
  radius1 = radius;
  radius2 = radius + 10;
  radius3 = radius + 20;
  slice = TWO_PI/count;

  for (int j = 0; j < numOfCircles; j++) {
    for (int i = 0; i < count; i++) {
      theta = i * slice;
      int toggle = int(random(3));
      if (toggle == 2) {
        radius = radius3;
      } else if (toggle == 1) {
        radius = radius2;
      } else {
        radius = radius1;
      }
      x[j][i] = cos(theta) * radius;
      y[j][i] = sin(theta) * radius;
    }
    //drawGuides();
    radius1 += radiusOffset;
    radius2 += radiusOffset;
    radius3 += radiusOffset;
  }

  stroke(orange);
  noFill();

  for (int j = 0; j < numOfCircles; j++) {
    beginShape();
    curveVertex(x[j][count-1], y[j][count-1]);
    for (int i = 0; i < count; i++) {
      curveVertex(x[j][i], y[j][i]);
    }
    curveVertex(x[j][0], y[j][0]);
    curveVertex(x[j][1], y[j][1]);
    endShape();
  }

  for (int j = 0; j < numOfCircles; j++) {
    for (int i = 0; i < count; i++) {
      stroke(255);
      point(x[j][i], y[j][i]);
    }
  }
}

void draw() {
}

void drawGuides() {
  pushStyle();
  noFill();
  stroke(255, 60);
  ellipse(0, 0, radius1*2, radius1*2);
  stroke(255, 90);
  ellipse(0, 0, radius2*2, radius2*2);
  stroke(255, 120);
  ellipse(0, 0, radius3*2, radius3*2);
  popStyle();
}