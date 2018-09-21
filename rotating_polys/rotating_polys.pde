float angle = 0;
float targetAngle = 0;
float easing = 0.01;
float sz = 50 ;

void setup() {
  size(600, 600);
  surface.setResizable(true);
  background(0);
}

void draw() {
  background(200);
  noFill();
  stroke( 0 );


  for (float i = sz; i < width+sz; i+= sz) {  
    for (float j = sz; j < width+sz; j+= sz) {  
      
       PVector mouse = new PVector(mouseX, mouseY);
      PVector c = new PVector(i,j);
      float d= PVector.dist(mouse, c);
      
      float tA = map(d,0,50,0,2*TWO_PI);
      
      
      angle = atan2( mouseY - i, mouseX - j);
      // calculate the shortest rotation direction
      float dir = (angle - targetAngle) / tA;
      dir = dir - Math.round(dir);
      dir = dir * tA;

      // ease rotation
      targetAngle += dir * easing;
       
     
       
      

      pushMatrix();
      translate( i, j);
      rectMode(CENTER);
       if(d <100){     
      rotate( targetAngle );
       }
      rect( 0, 0, 16, 3 );
      popMatrix();
    }
  }
}
