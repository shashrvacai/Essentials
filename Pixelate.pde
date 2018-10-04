int gX, gY;  // size of pixellation 

void setup() {
  size(600, 600);
  surface.setResizable(true);
  background(0);
  noStroke();
  rectMode(CENTER);

}

void draw() {
  background(0);  
  gX = int(map(mouseX, 0, width, 50, 2));
  gY = int(map(mouseY, 0, height, 2, 50));
  
  Pixelate();
}

void Pixelate() {
  for (int i = 0; i< width; i+= gX) {
    for (int j = 0; j< height; j+= gY) {
      color fColor = get(i, j);
      fill(fColor);      
      rect(i, j, gX, gY);
    }
  }
}
