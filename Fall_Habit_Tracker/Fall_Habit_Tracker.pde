float margin = 50;
float count = 30;
float numOfTasks = 6;
float xx, yy;
float tasksHeight, taskOffset, taskHeightWGap, taskHeight;
color taskColor;
float strokeWidth;
float gapBetweenTasks = 10;
float currentHeight;
float opacity;
String[] options = {"Yes", "Kind Of", "No"};

void setup() {
  size(500, 700);
  background(50);
  
  noFill();
  stroke(255);
  
  currentHeight = height-margin*2;
  tasksHeight = currentHeight + gapBetweenTasks;
  taskHeightWGap = tasksHeight/numOfTasks;
  taskHeight = taskHeightWGap - gapBetweenTasks;
  
  xx = width - margin;
  
  //line(margin, margin, margin, height - margin);
  //line(xx, margin, xx, height - margin);

  for (int j = 0; j < numOfTasks; j++) {
    taskOffset = j * taskHeightWGap;
    taskColor = color(random(0), random(100, 255), random(100, 255));
    for (int i = 0; i < count; i++) {
      float tension = (width - margin*2)/2;
      float gapBetweenCount = count-1;
      float x = margin;
      float y = i * taskHeight/gapBetweenCount + margin + taskOffset;
      float diameter = 4;
      
      int toggle = int(random(3));
      if (toggle == 2) {
        yy = 0 * (height - margin*2)/2 + margin;
        opacity = 1;
        strokeWidth = 1.5;
      } else if (toggle == 1) {
        yy = 1 * (height - margin*2)/2 + margin;
        opacity = .66;
        strokeWidth = 1;
      } else {
        yy = 2 * (height - margin*2)/2 + margin;
        opacity = .33;
        strokeWidth = .5;
      }
      opacity = map(opacity, 0, 1, 0, 255);
      stroke(taskColor, opacity);
      ellipse(x, y, diameter, diameter);
      strokeWeight(strokeWidth);
      bezier(x, y, x + tension, y, xx - tension, yy, xx, yy);
    }
  }
  
  textMode(MODEL);
  for (int i = 0; i < 3; i++) {
    yy = i * (height - margin*2)/2 + margin;
    float textHeight = textDescent() - textAscent();
    text(options[i], xx, yy - textHeight/2);
  }
  
  textAlign(CENTER);
  for (int i = 0; i < numOfTasks; i++) {
    float x = margin;
    float y = i * taskHeightWGap + margin + taskHeight/2;
    pushMatrix();
    translate(x, y);
    rotate(-HALF_PI);
    text("task" + (i+1), 0, -margin/2);
    popMatrix();
  }
}

void draw() {
  
}