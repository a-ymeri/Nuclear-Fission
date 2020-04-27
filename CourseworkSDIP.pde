ArrayList<Atom> atoms;
ArrayList<Particle> neutrons;
Atom a;
Particle p;
void setup() {
  size(800, 800);
  PVector location = new PVector(width/2, height/2);
  atoms = new ArrayList<Atom>();
  neutrons = new ArrayList<Particle>();
  a = new Atom(234, 23, location);
  atoms.add(a);
  p = new Particle(new PVector(width/2,height/3), new PVector(0,1));
  neutrons.add(p);
}

void draw() {
  background(127);
  for(int i = 0; i<atoms.size();i++){
    atoms.get(i).step();
    atoms.get(i).display();
    atoms.get(i).collide(neutrons,atoms);
  }
   for(int i = 0; i<neutrons.size();i++){
    neutrons.get(i).step();
    neutrons.get(i).display();
  }
}
