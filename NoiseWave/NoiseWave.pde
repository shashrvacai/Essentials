float yoff = 0.0;        // 2nd dimension of perlin noise

void setup() {
  size(640, 360);
}

void draw() {
  background(51);

  fill(255);  
  float xoff = 0;       // Option #1: 2D Noise
  for (float x = 0; x <= width; x += 10) {
    float y = map(noise(xoff, yoff), 0, 1, 200,300); // Option #1: 2D Noise
    stroke(255);
    strokeWeight(0.5);
    line(x,height , x, y);
    xoff += 0.05;
  }
  yoff += 0.01;
}
