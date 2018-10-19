PVector posRun ;
float q = 0.0 ;
float RaX, RaY  ;
float x, y, tX ;
float inc =0.05; // increment value 
float  e = 0.05; // easing value 
boolean ver = false, hor = false  , rev = false ;

void setup() {
  size(600, 600);
  surface.setResizable(true);
  background(0);
  RaX = width/2 ; 
  RaY = height/2;
  posRun = new PVector(0,0);
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  noFill();

  fill(255);
  if (ver) {
    posRun.x= sin(q) * RaX ;
  } else {
    tX = 0 ;
  }
  float dX = tX - x ; 
  posRun.x+= dX *e ;

  if (hor) {
    posRun.y = cos(q) * RaY ;
  } else {
    float tY = 0 ;
    float dY = tY - y ; 
    posRun.y+= dY *e ;
  }


  pushMatrix();
  translate(width/2, height/2);
  ellipse(posRun.x, posRun.y, 10, 10);
  popMatrix();
  
  if (!rev){
  q +=inc ;
  }else {q -= inc;}
  
}

void keyPressed() {
  if (key == 'v') {
    ver = !ver ;
  } else if (key == 'h') {
    hor = !hor ;
  } else if (key == 'r') {
    rev = !rev ;
  } 
}
