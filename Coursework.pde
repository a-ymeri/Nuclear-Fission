import g4p_controls.*;

ArrayList<Atom> atoms;
ControlRod[] controlRods;
ArrayList<Particle> particles;
boolean fire = false;
boolean rodUp = false;
float energy;
boolean lockedOn;
ArrayList <GSlider> sliders;
GSlider simulationSlider, uraniumSlider;

int handleX,handleY, handleWidth, handleHeight;
int containerX, containerY, containerWidth, containerHeight;
int yOffSet;
void setup() {
  
  sliders = new ArrayList<GSlider>();
  setupSliders();
  
  
  size(1920, 1080);
  frameRate(120);
  init();
}

void init(){
  energy = 0;
  lockedOn = false;
  //645, 420, 650, 30
  handleX = 645;
  handleY = 480;
  handleWidth = 650;
  handleHeight = 30;
  
  containerX = 620;
  containerY = 600;
  containerWidth = 700;
  containerHeight = 300;
  
  
  //slider.setOpaque(true);
  
  atoms = new ArrayList<Atom>();
  particles = new ArrayList<Particle>();
  
  int uraniumNumber = uraniumSlider.getValueI();
  int atomX,atomY;
  int counter=0;
  while(counter<uraniumNumber){
    atomX = counter%10;
    atomY = counter/10;
  //for (int i = 0; i<10; i++) {
  //  for (int j = 0; j<12; j++) {
      atoms.add(new Atom(143, 92, containerX+20+atomX*70, containerY+20+atomY*20));
  //  }
  //}
    counter++;
  }
  controlRods = new ControlRod[4];
  int x = containerWidth+40;
  for (int i=0; i<4; i++) {
    controlRods[i] = new ControlRod(x, 510);
    x+=containerWidth/5;
  }

  if (mousePressed==true) {
    mouseClicked();
  }
}


void draw() {
  if(frameCount % (int)(2/simulationSlider.getValueF()) == 0){
    background(#FFFFFF);
    fireNeutronsButton();
    resetButton();
    moveControlRodsButton();
    slider();
    fill(#A7D3F0);
    strokeWeight(10);
  
    rect(containerX, containerY, containerWidth, containerHeight);
    strokeWeight(1);
    for (int i=0; i<atoms.size(); i++) {
      atoms.get(i).step();
      atoms.get(i).display();
      energy+=atoms.get(i).collide(particles, atoms);
      if(energy>200) energy=200;
    }
    if (fire) {
      particles.add(new Particle(containerX,containerY,containerWidth,containerHeight));
      fire = false;
    }
    for (int i = 0; i<particles.size(); i++) {
      particles.get(i).display();
      particles.get(i).step();
      particles.get(i).bounceOnEdges(containerX, containerY, containerWidth, containerHeight);
    }
    for (int i = 0; i<controlRods.length;i++){
      if(!rodUp){
        controlRods[i].absorb(particles);
        controlRods[i].display();
        //controlRods[i].setHeight();
      }
    }
    displayEnergyBar();
    energy=energy*0.992;
  }
}




void fireNeutronsButton() {
  strokeWeight(2);
  fill(#FFFFFF);
  rect(width-100, 70, 50, 50);
  fill(#D61A1D);
  ellipse(width-100+24, 95, 30, 30);
  fill(#000501);
  textSize(32);
  text("F I R E     N E U T R O N S", width-600, 110);
}
void resetButton(){
  strokeWeight(2);
  fill(#FFFFFF);
  rect(width-100, 140, 50, 50);
  fill(#D61A1D);
  ellipse(width-100+25, 165, 30, 30);
  fill(#000501);
  textSize(32);
  text("RESET SIMULATION", width-600, 180);
}
void slider(){
  textSize(16);
  text("Simulation speed", width-320, height/3-10);
  textSize(16);
  text("Number of uraniums", width-320, height/3+190);
}
void moveControlRodsButton(){
  fill(#EAE126);
  rect(handleX, handleY, handleWidth, handleHeight);
  fill(#050500);
  textSize(24);
  text("C O N T R O L     R O D S", 800, handleY+25);
}

boolean overFire() {
  if (mouseX>=width-100 && mouseX<=width-50 && mouseY>=70 && mouseY<=120) {
    return true;
  } else {
    return false;
  }
}

boolean overUp(){
  if (mouseX>=1300 && mouseX<=1370 && mouseY>=400 && mouseY<=470){
    return true;
  } else {
    return false;
  }
}

boolean overHandle(){
  if(mouseX>=handleX && mouseX<=handleX+handleWidth && mouseY>=handleY && mouseY <= handleY+handleHeight) 
    return true;
  else 
    return false;
}

boolean resetSimulation(){
   if (mouseX>=width-100 && mouseX<=width-50 && mouseY>=140 && mouseY<=190){
    return true;
  } else{
    return false;
  }
}

boolean overUraniumSetter(){
   if (mouseX>=width-100 && mouseX<=width-50 && mouseY>=140 && mouseY<=190){
    return true;
  } else{
    return false;
  }
}



void displayEnergyBar(){
  fill(#666666);
  strokeWeight(1);
  rect(width-500,height/2+100,40,200);
  fill(#D61A1D);
  strokeWeight(0);
  rect(width-500,height/2+300-energy,40,energy);
}

void setupSliders(){
  
  simulationSlider = new GSlider(this,width-400,height/3,300,60,10);  
  simulationSlider.setLimits(1, 0.5, 2);
  simulationSlider.setNbrTicks(8);
  simulationSlider.setNumberFormat(G4P.DECIMAL,0);
  
  uraniumSlider = new GSlider(this, width-400, height/3+200,300, 60, 10);
  uraniumSlider.setLimits(60, 30, 120);
  uraniumSlider.setNbrTicks(12);
  uraniumSlider.setNumberFormat(G4P.INTEGER,0);
  
  sliders.add(simulationSlider);
  sliders.add(uraniumSlider);
  
  for(GSlider gs : sliders){
    gs.setShowValue(true);
    gs.setShowLimits(true);
    gs.setShowTicks(true);
    gs.setEasing(6.0);
    
  }
}

void mousePressed() {
  if (overFire()) {
    fire=true;
  }else if(resetSimulation() || overUraniumSetter()){
    init();
  }else{
    if(overHandle()){
      lockedOn = true;
    }else{
      lockedOn = false;
    }
  yOffSet = mouseY-handleY;
  }
}

void mouseDragged() {
  int y = mouseY;
  y = constrain(y, 480 - containerHeight+yOffSet, 480+yOffSet);
  if(lockedOn){
    handleY = y - yOffSet;
    for(int i =0 ; i<controlRods.length;i++){
      controlRods[i].setY(handleY+handleHeight);
    }
  }
}

void mouseReleased() {
  lockedOn = false;
}
