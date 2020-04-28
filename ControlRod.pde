class ControlRod {
  PVector location;
  PVector out;
  float _width;
  float _height;
  
  ControlRod(int x, int y) {
    _width = 30;
    _height = 350;
    location = new PVector(x, y);
    out = new PVector(x, y-100);
  }

  void display() {
    fill(#4C30CE);
    strokeWeight(4);
    rect(location.x, location.y, _width, _height); //one rod
    fill(#EAE126);
    //noStroke();
    rect(width/4-10, 230, 650, 30);
    fill(#050500);
    textSize(24);
    text("C O N T R O L     R O D S", width/4+80, 255);
    fill(#FFFFFF);
    strokeWeight(2);
    rect(870, 210, 70, 70);
    fill(#D61A1D);
    ellipse(905, 245, 50, 50); //Button
  }

  void step() {
    if (mousePressed == true) {
      location.add(out);
    }
  }

  void absorb(ArrayList<Particle> particles) {
    for (int i =0; i<particles.size(); i++) {
      
      float distanceX = particles.get(i).location.x-location.x;
      float distanceY = particles.get(i).location.y-location.y;
      if (distanceX>0 && distanceX<_width && distanceY>0 && distanceY<_height) {
        particles.remove(i);
      }
    }
  }
}
