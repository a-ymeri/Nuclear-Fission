class ControlRod{
  int _height;
  int _width;
  PVector location;
  PVector out;
  
  ControlRod(int x, int y){
    //_width=x;
    //_height=y;
    location = new PVector(x, y);
    out = new PVector(x, y-100);
  }
  
  void display(){
    fill(#4C30CE);
    strokeWeight(4);
    rect(location.x, location.y, 30, 350); //one rod
    fill(#EAE126);
    //noStroke();
    rect(width/4, 230, 650, 30);
    fill(#050500);
    textSize(24);
    text("C O N T R O L     R O D S", width/4+80,255);
    fill(#FFFFFF);
    strokeWeight(2);
    rect(870, 210, 70,70);
    fill(#D61A1D);
    ellipse(905, 245, 50, 50); //Button
    
    
  }
  
  void step(){
    if(mousePressed == true){
      location.add(out);
    }
  }
  
  void absorb(Particle p){
    if(p.location.x >this.location.x) p.mass = 0; 
  }
  
  
}
