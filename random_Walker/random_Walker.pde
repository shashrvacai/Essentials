PVector pos, nOff ;

void setup(){
  size(600,600);
  pos = new PVector(width/2,height/2);
  nOff = new PVector(random(10000),random(1000));
}

void draw(){
  pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(0.01,0.01,0);
   ellipse(pos.x, pos.y, 48, 48);
}
