ArrayList<Atom> atoms;
ControlRod[] controlRods;
ArrayList<Particle> particles;
boolean fire = false;
boolean rodUp = false;
float energy;

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
  update(mouseX, mouseY);
  background(#FFFFFF);
  fireNeutronsButton();
  resetButton();
  moveControlRodsButton();
  fill(#A7D3F0);
  strokeWeight(10);
  rect(120, 300, 700, 300);
  strokeWeight(1);
  for (int i=0; i<atoms.size(); i++) {
    atoms.get(i).step();
    atoms.get(i).display();
    energy+=atoms.get(i).collide(particles, atoms);
    if(energy>200) energy=200;
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
    if(!rodUp){
      controlRods[i].absorb(particles);
      controlRods[i].display();
      //rodDown=false;
    }
    //controlRods[i].step();
  }
  displayEnergyBar();
  energy=energy*0.992;
}


void mousePressed() {
  if (overFire()) {
    fire=true;
  }else if(overUp() && !rodUp){
    rodUp=true;
  }
  else if(overUp() && rodUp){
    rodUp=false;
  }
  if(resetSimulation()){
    init();
  }
  /*if(overDown()){
    rodDown=true;
  }*/
}

void update(int x, int y){
  //if(overUp()){
    //rodUp = true;
   // rodDown = false;
  /*} else if (overDown()){
    rodUp = false;
    rodDown = true;
  }*/ //else {
    //rodUp = false;
  //}
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
void resetButton(){
  strokeWeight(2);
  fill(#FFFFFF);
  rect(600, 140, 50, 50);
  fill(#D61A1D);
  ellipse(625, 165, 30, 30);
  fill(#000501);
  textSize(32);
  text("RESET SIMULATION", 247, 180);
}

void moveControlRodsButton(){
  fill(#EAE126);
  rect(width/4-11, 219, 650, 30);
  fill(#050500);
  textSize(24);
  text("C O N T R O L     R O D S", width/4+80, 244);
  fill(#FFFFFF);
  strokeWeight(2);
  rect(870, 200, 70, 70);
  if(overUp()){
    fill(#32CE5D);
    ellipse(905, 235, 50, 50);
  } else {
    fill(#D61A1D);
    ellipse(905, 235, 50, 50); //Button
  }
  //ellipse(905, 300, 50, 50);
}

boolean overFire() {
  if (mouseX>=645 && mouseX<=695 && mouseY>=70 && mouseY<=120) {
    return true;
  } else {
    return false;
  }
}

boolean overUp(){
  if (mouseX>=880 && mouseX<=930 && mouseY>=210 && mouseY<=260){
    return true  ;
  } else {
    return false;
  }
}

boolean resetSimulation(){
   if (mouseX>=600 && mouseX<=650 && mouseY>=140 && mouseY<=190){
    return true;
  } else{
    return false;
  }
}

void displayEnergyBar(){
  fill(#666666);
  strokeWeight(5);
  rect(width-width/7,height/2,40,200);
  fill(#D61A1D);
  strokeWeight(5);
  rect((6*width/7),height/2+200-energy,40,energy);
}
