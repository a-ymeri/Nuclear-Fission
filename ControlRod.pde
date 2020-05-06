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
