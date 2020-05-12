ArrayList<Atom> atoms;
ControlRod[] controlRods;
ArrayList<Particle> particles;
boolean fire = false;
boolean rodUp = false;
float energy;
boolean lockedOn;

int handleX,handleY, handleWidth, handleHeight;
int containerX, containerY, containerWidth, containerHeight;
int yOffSet;
void setup() {
  size(1920, 1080);
  frameRate(50);
  init();
}

void init(){
  lockedOn = false;
  //645, 420, 650, 30
  handleX = 645;
  handleY = 420;
  handleWidth = 650;
  handleHeight = 30;
  
  containerX = 620;
  containerY = 600;
  containerWidth = 700;
  containerHeight = 300;
  
  atoms = new ArrayList<Atom>();
  particles = new ArrayList<Particle>();
  for (int i = 0; i<10; i++) {
    for (int j = 0; j<12; j++) {
      atoms.add(new Atom(143, 92, containerX+20+i*70, containerY+20+j*20));
    }
  }
  controlRods = new ControlRod[4];
  int x = containerWidth+40;
  for (int i=0; i<4; i++) {
    controlRods[i] = new ControlRod(x, 455);
    x+=containerWidth/5;
  }

  if (mousePressed==true) {
    mouseClicked();
  }
}


void draw() {
  background(#FFFFFF);
  fireNeutronsButton();
  resetButton();
  moveControlRodsButton();
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
      //controlRods[i].setHeight();
    }

 /*if(rodUp){
      controlRods[i].absorb(particles);
      controlRods[i].display();


      if(controlRods[i].getHeight() > 150){
            int x= width/4-10;
     // for(int j= 0 ; j<4 ; j++){
    controlRods[0].moveUp(x, 250);
    x+= 700/5;

    controlRods[1].moveUp(x,250);
    x+= 700/5;

     controlRods[2].moveUp(x,250);
    x+= 700/5;


     controlRods[3].moveUp(x,250);
    x+= 700/5;
      }



     //}


      //rodDown=false;
    }*/


    //controlRods[i].step();
  }
  displayEnergyBar();
  energy=energy*0.992;
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

void moveControlRodsButton(){
  fill(#EAE126);
  rect(handleX, handleY, handleWidth, handleHeight);
  fill(#050500);
  textSize(24);
  text("C O N T R O L     R O D S", 800, handleY+25);
  fill(#FFFFFF);
  strokeWeight(2);
  
  rect(1300, 400, 70, 70);
  if(overUp()){
    fill(#32CE5D);
    ellipse(1335, 435, 60, 60);
  } else {
    fill(#D61A1D);
    ellipse(1335, 435, 60, 60); //Button
  }
  //ellipse(905, 300, 50, 50);
}

boolean overFire() {
  if (mouseX>=width-100 && mouseX<=width-50 && mouseY>=70 && mouseY<=95) {
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

void displayEnergyBar(){
  fill(#666666);
  strokeWeight(5);
  rect(width-width/7,height/2,40,200);
  fill(#D61A1D);
  strokeWeight(5);
  rect((6*width/7),height/2+200-energy,40,energy);
}

void mousePressed() {
  if (overFire()) {
    fire=true;
  }
  if(resetSimulation()){
    init();
  }
  
  if(overHandle()){
    lockedOn = true;
  }else{
    lockedOn = false;
  }
  yOffSet = mouseY-handleY;
}

void mouseDragged() {
  int y = mouseY;
  y = constrain(y, 420 - containerHeight+yOffSet, 420+yOffSet);
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
