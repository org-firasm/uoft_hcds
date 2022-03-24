int choice;
color shapeColor;
void setup() {
  size(1000, 1000);
  rectMode(CENTER);
  background(0);
  colorMode(HSB, 255, 255, 255, 100);
}

void draw() {
}
void keyPressed() {
  if (keyCode == ' ') {
    background(255);
    drawShape();
  }

  if (keyCode == UP) {
    up();
  }
  if (keyCode == DOWN) {
    down();
  }
}
void drawShape() {
  choice = int(random(50));
  int age = int(random(0, 100));
  int priors = int(random(2, 12));
  textSize(50);
  text("Up or down?",width/2 + 100,height/2+10);

  if (choice%2 == 0) {
    //regular - recidivate
    shapeColor = color(random(256), 200, 200, constrain(age+40, 40, 100));
    fill(shapeColor);
    stroke(shapeColor);
    polygon(width/2, height/2, 100, priors, false);
    //text(priors, width/2, 200);
  } else {
    //blob - not recidivate
    shapeColor = color(random(256), 200, 200, constrain(age-30, 15, 100));
    fill(shapeColor);
    noStroke();
    polygon(width/2, height/2, 100, priors+1, true);
    //text(priors+1, width/2, 800);
  }
}

void polygon(float x, float y, float radius, int npoints, boolean blob) {
  float angle = TWO_PI / npoints;

  if (blob == true) {
    beginShape();
    for (float a = 0; a < 1.2*TWO_PI; a += angle) {
      float offset = map(sin(a*2), -1, 1, -4, 4);
      float sx = x+offset + cos(a) * radius;
      float sy = y+offset + sin(a) * radius;
      curveVertex(sx, sy);
    }
    curveVertex(x+radius, y);
    endShape(CLOSE);
  } else {
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}

void up() {
  fill(255, 255, 255);
  rect(width/2, 280, 200, 100);
  fill(255);
  text("UP", width/2-35, 300);
  // draw arrow down
  noStroke();
  fill(255, 255, 255);
  rect(width/2, 150, 30, 100);
  triangle(width/2-50, 150, width/2+50, 150, width/2, 25);
}

void down() {
  fill(100, 100, 50);
  rect(width/2, 680, 200, 100);
  fill(255);
  text("DOWN", width/2-70, 700);
  // draw arrow down
  noStroke();
  fill(100, 100, 50);
  rect(width/2, 800, 30, 100);
  triangle(width/2-50, 800, width/2+50, 800, width/2, 950);
}
