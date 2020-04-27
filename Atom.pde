class Atom{
  //Atomic mass refers to the sum of atomic number and the number of neutrons
 int mass;
 int atomicNumber;
 int neutronNumber;
 PVector location;
 PVector velocity;
 PVector acceleration;
 
 Atom(int atomicNumber, int neutronNumber,PVector location){
   this.atomicNumber = atomicNumber;
   this.neutronNumber = neutronNumber;
   mass = atomicNumber + neutronNumber;
   this.location = location;
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
 }
 
 void step(){
  location = location.add(velocity); 
  velocity = velocity.add(acceleration);
 }
 
 void display(){
   fill(#ff00ff);
   ellipse(location.x,location.y,mass/20,mass/20);
 }
 
 void collide(ArrayList<Particle> particles, ArrayList<Atom> atoms){
  float radius = 5;
  for(Particle particle: particles){
    float distance = PVector.sub(particle.location,this.location).mag();
    if(distance<radius && atomicNumber>90){
      splitAtom(atoms);
      
      for(int i = 0; i<3; i++){
        PVector location1 = new PVector(location.x+10*i,location.y+10*i);
        PVector velocity1 = new PVector(location.x+10*i,location.y+10*i);
        particles.add(new Particle(location1, velocity1));
      }
      break;
    }
  }
 }
 
 void splitAtom(ArrayList<Atom> atoms){
   Atom kr = new Atom(36,55,new PVector(location.x+5,location.y+5));
   Atom ba = new Atom(56,86, new PVector(location.x+5,location.y-5));
   atoms.add(kr);
   atoms.add(ba);
   atoms.remove(this);
 }
}
