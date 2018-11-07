int initialRadius, radius, innerRadius, radiusOffset;
float slice;
float theta;
float cx, cy;
int count, numberOfCircles;
float posy;
color navy, orange;

void setup() {
  size(500, 500);
  navy = color(0, 0, 60);
  orange = color(255, 80, 83);
  background(navy);

  fill(orange);
  noStroke();

  radiusOffset = 30;
  innerRadius = 20;
  initialRadius = 230;
  radius = initialRadius;

  numberOfCircles = 7;
  count = 31;
  theta = 0;
  slice = TWO_PI/count;

  cx = width/2;
  cy = height/2;
  translate(cx, cy);

  for (int j = numberOfCircles; j > 0; j--) {
    stroke(orange);
    fill(navy);
    ellipse(0, 0, radius*2, radius*2);
    for (int i = 0; i < count; i++) {
      theta = i * slice;
      //fill(orange, map(i, 0, count, 50, 150));
      int r = int(random(3));
      if (r == 0) {        
        fill(orange, 255);
      } else if (r == 1) {
        fill(orange, 170);
      } else {
        noFill();
      }
      arc(0, 0, radius*2, radius*2, theta, theta+slice);
    } 
    radius -= radiusOffset;
  }
  fill(navy);
  ellipse(0, 0, innerRadius*2, innerRadius*2);

  drawSlicers();
  drawText();
}

void draw() {
}

void drawSlicers() {
  for (int i = 0; i < count; i++) {
    rotate(slice);
    stroke(orange);
    line(innerRadius, 0, initialRadius, 0);
  }
}

void drawText() {
  fill(255);
  textMode(MODEL);
  textAlign(CENTER);
  posy = -50;
  for (int i = 0; i < numberOfCircles; i++) {
    text("Hello", 0, posy);
    posy -= radiusOffset;
  }
}