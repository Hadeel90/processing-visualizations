int numOfLayers;
int count, curveWidth, curveHeight, tension, margin, heightOffset, finalHeight;
int initialHeight, h1, h2, h3;
float slice;
float c1x, c1y, c2x, c2y;
float points[][];
int r;
int[] letters = {7, 18, 1, 16, 8};

void setup() {
  size(500, 500);
  background(50);
  
  drawGraph();
}

void drawGraph() {
  numOfLayers = 5;
  initialHeight = 30;
  heightOffset = initialHeight * 2;
  h1 = initialHeight;
  h2 = 0;
  h3 = -initialHeight;

  margin = 50;
  curveWidth = width - margin;
  count = letters[0];
  points = new float[numOfLayers][count];
  //Less tension leads to a smaller curve and vice versa
  tension = 30;
  slice = curveWidth/count;
  finalHeight = heightOffset * numOfLayers;
  //println(height/2 - finalHeight/2 + initialHeight);
  translate(0, height/2 - finalHeight/2 + initialHeight);

  for (int j = 0; j < numOfLayers; j++) {
    for (int i = 0; i < count; i++) {
      r = int(random(3));
      if (r == 2) {
        curveHeight = h1;
      } else if (r == 1) {
        curveHeight = h2;
      } else {
        curveHeight = h3;
      }
      points[j][i] = curveHeight;
    }
    //GUIDES
    //line(margin, h1, curveWidth, h1);
    //line(margin, h2, curveWidth, h2);
    //line(margin, h3, curveWidth, h3);
    h1 += heightOffset;
    h2 += heightOffset;
    h3 += heightOffset;
  }

  noFill();
  stroke(255);

  for (int j = 0; j < numOfLayers; j++) {
    beginShape();
    vertex(margin, points[j][0]);
    stroke(255, map(j, 0, numOfLayers, 100, 150));
    //GUIDES
    //ellipse(margin, points[j][0], 10, 10);
    //line(margin, points[j][0], margin+tension, points[j][0]);
    for (int i = 1; i < count; i++) {
      float posx = i * slice + margin;
      float posy = points[j][i];

      c1x = (i-1) * slice + margin + tension;
      c1y = points[j][i-1];
      c2x = posx - tension;
      c2y = posy;

      bezierVertex(c1x, c1y, c2x, c2y, posx, posy);

      //GUIDES
      //line(c2x, c2y, posx, posy);
      //line(c2x, c1y, c1x, c1y);
      //ellipse(posx, posy, 10, 10);
    }
    endShape();
  }
}