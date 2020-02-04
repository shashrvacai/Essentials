
import org.openkinect.processing.*;
Kinect2 K ;   // k in the kinect object


PGraphics canvas;

float dMin =1400 ;
float dMax = 1900 ;


void setup() {
  size(1920, 1080, P2D);

  canvas = createGraphics(width, height, P2D);
  canvas.beginDraw();
  canvas.background(255, 0, 0);
  canvas.stroke(200);
  canvas.endDraw();

  K = new Kinect2(this);
  K.initDepth();  // int depth ; 
  K.initDevice();
}

 void draw(){
 
     canvas.beginDraw();

  pushMatrix();
  canvas.fill(0,10);
  canvas.rect(0, 0, width, height);
  canvas.noFill();
  popMatrix();

  PImage dep =  K.getDepthImage();  // depth img
  //image(dep,0,0);   // test depth image
  int[]  Rdep = K.getRawDepth();

  float sX = 0 ;   /// sum of X 
  float sY = 0 ;   /// sum of Y
  float tP = 0 ;   /// total number of pixels 

  float s = 2;    // skip
  float r = 5;    // range
    
  for (int x = 0; x < dep.width; x+=s) {
    for (int y = 0; y < dep.height; y+=s) {
      int  i = x + y* dep.width;    // index 
      float b = brightness(dep.pixels[i]);  
      int d = Rdep[i];   // depth index
      float n = map(d, dMin, dMax, 10, 255);
      //float si = map(n, 0, 255, s*r, s/r);
      float si = map(n, 0, 255, 0.5, 10);   ///reverse

      float m = map(b, 0, 255, 8, 50); // mapping brightness values 

      if (d >dMin && d <dMax) {

        canvas.fill(255, 255-n, n, 255);   // pink to orange
         canvas.noStroke();
        float X = map(x, 0, dep.width, 0, 1920);
        float Y = map(y, 0, dep.width, 0, 1380);
        canvas.ellipse(X, Y, si, si);
        sX += X ;
        sY += Y ;
        tP ++ ;
      } else {
      }
    }
  }

  float aX = sX /tP ;
  float aY = sY /tP ;


  fill(125);
 // canvas.ellipse(aX, aY, 20, 20);
canvas.endDraw();
   
   image(canvas,0, 0,width,height);
 }
