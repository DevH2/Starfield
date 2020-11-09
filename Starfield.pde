Particle[] p;
float t = 0;
class Particle {
  int colorS;
  double angle,speed;
  float x,y,diameter;
  Particle(){
    this.x = 200;
    this.y = 200;
    this.angle = Math.random()*2*Math.PI;
    this.speed = (Math.random()*3);
    this.diameter = 30;
    this.colorS = (int)(Math.random()*120+76);
  }
  void show(){
    if(this.diameter < 1){
      return;
    }
    fill(this.colorS,this.colorS,this.colorS,63);
    rect(this.x,this.y, this.diameter, this.diameter);
    this.diameter-=0.02;
  }
  void move(){
    this.x = (float)(speed*Math.cos(angle)+this.x);
    this.y = (float)(speed*Math.sin(angle)+this.y);
  }
}
class OddBall extends Particle {
  PImage roach;
  OddBall(){
    x = 170;
    y = 170;
    diameter = 60;
    roach = loadImage("Dead Roach.png");
  }
  void move(){
    if(t<17.5) //T is basically a timer, since the roach will die soon after the explosion
      x +=(int)(Math.random()*7)-3;
  }
  void show(){
    image(roach,x,y,diameter,diameter);
  }
}
void setup(){
  noStroke();
  frameRate(37);
  size(400,400);
  //theta = 0;
  p = new Particle[1500];
  for(int i = 0; i<p.length;i++){
    p[i] = new Particle();
  }
  p[0] = new OddBall();
  
  
}
void draw(){
  background(255);
  //theta += 0.01;
  t+=0.01;
  p[0].show();
  p[0].move();
  for(int i = 1; i<p.length;i++){
    p[i].show();
    p[i].move();
  }
}
