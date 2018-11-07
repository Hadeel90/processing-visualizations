Table table;
float cx, cy;
float margin;
PFont f;

void setup() {
  size(1000, 500);

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
  
  margin = 50;

  table = loadTable("January Habit Tracker 2018.csv", "header");

  table.removeColumn(0);
  
  textMode(MODEL);
  textAlign(CENTER);
  textFont(f);
}

void displayData() {
  for (int i = 0; i < table.getColumnCount(); i++) {
    println(table.getRow(0).getInt(i), table.getRow(table.getRowCount()-1).getInt(i));
    float value1 = table.getRow(0).getInt(i);
    float value2 = table.getRow(table.getRowCount()-1).getInt(i);
    float minDia = 10;
    float maxDia = 72;
    float diameter1 = map(value1, 0, 2, minDia, maxDia);
    float diameter2 = map(value2, 0, 2, minDia, maxDia);
    float sliceW = (width-margin*2-maxDia/2)/table.getColumnCount();
    float posx = margin + i * sliceW + maxDia/2;
    float posy1 = cy - maxDia/2 - margin/2;
    float posy2 = cy + maxDia/2 + margin/2;
    ellipse(posx, posy1, diameter1, diameter1);
    ellipse(posx, posy2, diameter2, diameter2);
    
    String task = table.getColumnTitle(i);
    float textHeight = textDescent() - textAscent();
    text(task, posx, cy - textHeight/2);
  }
  
}