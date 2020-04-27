class Atom {
  float mass;
  int atomicNumber;
  int neutrons;
  PVector location;
  PVector velocity;
  PVector acceleration;
  int x, y;

  Atom(int atomicNumber, int neutrons, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 1;
    this.atomicNumber = atomicNumber;
    this.neutrons = neutrons;
  }

  void display() {
    fill(#FFFFFF);

    ellipse(location.x, location.y, 5*mass, 5*mass);
    ellipse(location.x+6, location.y-2, 5*mass, 5*mass);
    ellipse(location.x+2, location.y+6, 5*mass, 5*mass);
    ellipse(location.x+11, location.y+5, 5*mass, 5*mass);
    fill(#D32B2B);
    ellipse(location.x+3, location.y+2, 5*mass, 5*mass);
    ellipse(location.x+10, location.y+1, 5*mass, 5*mass);
    ellipse(location.x+6, location.y+4, 5*mass, 5*mass);
  }

  void step() {
    location = location.add(velocity); 
    velocity = velocity.add(acceleration);
  }

  void collide(ArrayList<Particle> particles, ArrayList<Atom> atoms) {
    float radius = 10;
    for (int i =0; i<particles.size(); i++) {
      float distance = PVector.sub(particles.get(i).location, this.location).mag();
      if (distance<radius && atomicNumber>90) {
        splitAtom(atoms);
        particles.remove(i);
        for (int j = 0; j<3; j++) {
          PVector location1 = new PVector(location.x+10*j, location.y+10*j);
          PVector velocity1 = new PVector(1, 1);
          particles.add(new Particle(location1, velocity1));
        }
        break;
      }
    }
  }

  void splitAtom(ArrayList<Atom> atoms) {
    Atom kr = new Atom(36, 55, location.x+5, location.y+5);
    Atom ba = new Atom(56, 86, location.x+5, location.y-5);
    atoms.add(kr);
    atoms.add(ba);
    atoms.remove(this);
  }
}
