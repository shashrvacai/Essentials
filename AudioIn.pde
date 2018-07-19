import processing.sound.*;

Amplitude amp ;
AudioIn in;


void setup() {
  size(1000, 1000);
  background(0);
  
  amp = new Amplitude(this);
  in  = new AudioIn(this,0);
  in.start();
  amp.input(in); 
}

void draw () {
  float a = amp.analyze()*10;
}
