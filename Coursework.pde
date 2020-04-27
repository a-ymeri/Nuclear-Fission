ArrayList<Atom> atoms;
ControlRod[] c;
ArrayList<Particle> p;
boolean fire = false;
boolean rodButton = false;

void setup() {
  size(1000, 700);
  atoms = new ArrayList<Atom>();
  p = new ArrayList<Particle>();
  for (int i = 1; i<=9; i++) {
    for (int j = 1; j<=12; j++) {
      atoms.add(new Atom(143, 92, 145+i*70, 330+j*20));
    }
  }
  c = new ControlRod[4];
  int x = width/4;
  for (int i=0; i<4; i++) {
    c[i] = new ControlRod(x, 250);
    x+=137;
  }

  if (mouseX>=645 && mouseX<=695 && mouseY>=70 && mouseY<=120 && mousePressed==true) {
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
  //a.display();
  for (int i=0; i<4; i++) {
    c[i].display();
    //c[i].absorb(p);
    //c[i].step();
  }
  for (int i=0; i<atoms.size(); i++) {
    atoms.get(i).step();
    atoms.get(i).display();
    atoms.get(i).collide(p, atoms);
  }
  if (fire) {
    PVector location = new PVector(145, 330);
    PVector velocity = new PVector(-2, 2);
    p.add(new Particle(location, velocity));
    fire = false;
  }
  for (int i = 0; i<p.size(); i++) {
    p.get(i).display();
    p.get(i).step();
    p.get(i).bounceOnEdges();
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

//boolean overRodButton(){

//}
