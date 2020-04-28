ArrayList<Atom> atoms;
ControlRod[] controlRods;
ArrayList<Particle> particles;
boolean fire = false;
boolean rodButton = false;

void setup() {
  size(1000, 700);
  frameRate(50);
  init();
}

void init(){
  atoms = new ArrayList<Atom>();
  particles = new ArrayList<Particle>();
  for (int i = 0; i<10; i++) {
    for (int j = 0; j<12; j++) {
      atoms.add(new Atom(143, 92, 145+i*70, 330+j*20));
    }
  }
  controlRods = new ControlRod[4];
  int x = width/4-10;
  for (int i=0; i<4; i++) {
    controlRods[i] = new ControlRod(x, 250);
    x+=700/5;
  }

  if (mousePressed==true) {
    mouseClicked();
  }
}


void draw() {
  background(#FFFFFF);
  fireNeutronsButton();
  fill(#A7D3F0);
  strokeWeight(10);
  rect(120, 300, 700, 300);
  strokeWeight(1);
  for (int i=0; i<atoms.size(); i++) {
    atoms.get(i).step();
    atoms.get(i).display();
    atoms.get(i).collide(particles, atoms);
  }
  if (fire) {
    particles.add(new Particle());
    fire = false;
  }
  for (int i = 0; i<particles.size(); i++) {
    particles.get(i).display();
    particles.get(i).step();
    particles.get(i).bounceOnEdges();
  }
  for (int i = 0; i<controlRods.length;i++){
    controlRods[i].absorb(particles);
    controlRods[i].display();
    //controlRods[i].step();
  }
}


void mousePressed() {
  if (overFire()) {
    fire=true;
  }
}


void fireNeutronsButton() {
  strokeWeight(2);
  fill(#FFFFFF);
  rect(645, 70, 50, 50);
  fill(#D61A1D);
  ellipse(670, 95, 30, 30);
  fill(#000501);
  textSize(32);
  text("F I R E     N E U T R O N S", 247, 110);
}

boolean overFire() {
  if (mouseX>=645 && mouseX<=695 && mouseY>=70 && mouseY<=120) {
    return true;
  } else {
    return false;
  }
}
