Table table;
float theta;
float slice;
float radius, radius2;
float radiusOffset;
float cx, cy;
PFont f;

void setup() {
  size(700, 700);

  initialize();
  displayData();
}

void draw() {
}

void initialize() {
  background(255);
  fill(0);
  noStroke();

  f = createFont("Georgia", 12);

  cx = width/2;
  cy = height/2;

  theta = 0;
  radiusOffset = 10;
  radius = 20;

  table = loadTable("February Habit Tracker 2018.csv", "header");
  radius2 = radius + table.getRowCount() * radiusOffset;

  table.removeColumn(0);

  slice = TWO_PI/(table.getColumnCount());
}

void displayData() {

  for (TableRow row : table.rows()) {
    for (int j = 0; j < row.getColumnCount(); j++) {
      theta = j * slice;
      float posx = cx + cos(theta) * radius;
      float posy = cy + sin(theta) * radius;
      int value = row.getInt(j);
      if (value == 2) {
        ellipse(posx, posy, 10, 10);
      } else if (value == 1) {
        ellipse(posx, posy, 5, 5);
      } else {
        pushStyle();
        noFill();
        ellipse(posx, posy, 10, 10);
        popStyle();
      }
    }
    pushStyle();
    noFill();
    stroke(0, 50);
    ellipse(cx, cy, radius*2, radius*2);
    popStyle();
    radius += radiusOffset;
  }

  textMode(MODEL);
  textFont(f);
  for (int i = 0; i < table.getColumnCount(); i++) {
    String task = table.getColumnTitle(i);
    theta = i * slice;
    float posx = cos(theta) * radius2;
    float posy = sin(theta) * radius2;

    pushMatrix();
    translate(cx + posx, cy + posy);
    textAlign(CENTER);
    rotate(theta + HALF_PI);

    //float TextHeight = textDescent() - textAscent();
    //translate(posx, posy - TextHeight/2);
    //textAlign(LEFT);
    //rotate(theta);

    text(task, 0, 0);
    popMatrix();
  }
}