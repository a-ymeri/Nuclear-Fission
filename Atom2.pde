class Atom2 {
  Neutron[] n;
  Proton[] p;
  float mass;
  boolean remove = false;
  PVector location;
  PVector velocity;
  PFont font1;



  Atom2(int protons, int neutrons, float  x, float y) {
    p = new Proton[protons];
    n = new Neutron[neutrons];
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    font1 = createFont("Helvetica-Bold", 25);
    for (int i = 0; i<p.length; i++) {
      p[i] = new Proton(random(350, 550), random(100, 250));
    }
    for (int i = 0; i<n.length; i++) {
      n[i] = new Neutron(random(350, 550), random(100, 250));
    }
  }

  void display() {

    for (int i=0; i<p.length; i++) {
      p[i].display();
      p[i].step(location);
      n[i].display();
      n[i].step(location);
    }

    fill(#26DB51);
    textFont(font1);
    text("Ur-235", 480, 230);
  }

  void step() {
      location.add(velocity);
      display();
  }

  ArrayList<Atom2> splitAtom(Neutron n) {
    ArrayList<Atom2> al = new ArrayList<Atom2>();
    if (p.length>15) {
      Atom2 a1,a2;
      if (n.location.x>=530) {
        n.remove();
        //al.add(createBarium());
        a1 = createBarium();
        a2 = createKrypton();
        al.add(a1);
        al.add(a2);
        return al;
      }
    }
    return null;
  }

  Atom2 createBarium() {
    Atom2 barium = new Atom2(10, 10, location.x+20, location.y+20);
    barium.setVelocity(5, -5);
    return barium;
  }

  Atom2 createKrypton() {
    Atom2 krypton = new Atom2(10, 10, location.x+20, location.y+20);
    krypton.setVelocity(5, 5);
    return krypton;
  }

  void setVelocity(float x, float y) {
    velocity = new PVector(x, y);
  }
  
  boolean reachedEdge(){
    if(location.x>=width-250){
      return true;
    }
    return false;
  }
}
