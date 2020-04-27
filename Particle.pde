class Particle {
  //float charge;
  int mass;
  PVector location;
  PVector velocity;
  PVector acceleration;

  Particle(PVector location, PVector velocity) {
    mass = 1;
    this.location = location;
    this.velocity = velocity;
    acceleration = new PVector(0, 0);
  }

  void step() {
    velocity.add(acceleration);
    location.add(velocity); 
    acceleration = new PVector(0,0);
  }

  void display() {
    fill(#00ffff);
    ellipse(location.x, location.y, mass, mass);
  }
}
