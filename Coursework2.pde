/*Proton[] p;
Neutron[] n;*/
Uranium u;
Neutron n;

PImage img;
boolean fire = false;

void setup() {
  size(1000, 700);
  frameRate(15);
  init();
}
  
void init(){
  img = loadImage("gun.jpg");
  u = new Uranium();
  n = new Neutron(266, 220);
  
  if (mousePressed==true) {
    mouseClicked();
  }
  
  
}

void draw() {
  background(#FFFFFF);
  legend();
  fireButton();
  resetButton();
  u.display();
  if(fire){
    n.display();
    n.fire();
  }
  u.splitAtom(n);
  
}

void mousePressed(){
  if(overFire()){
    fire=true;
  } else if(resetSimulation()){
    init();
    fire = false;
  }
}




void fireButton(){
  image(img, 80, 190, 180, 100);
  fill(#000301);
  textSize(20);
  text("Fire neutron", 112, 305);
  if(overFire()){
    fill(#21CB47);
    ellipse(170, 260, 30, 30);
  } else {
    fill(#DB2629);
    ellipse(170, 260, 30, 30);
  }
}


void resetButton(){
  strokeWeight(2);
  fill(#FFFFFF);
  rect(660, 400, 50, 50);
  if(resetSimulation()){
    fill(#32CE5D);
  }else{
    fill(#D61A1D);
  }
  ellipse(685, 425, 30, 30);
  fill(#000501);
  textSize(25);
  text("RESET SIMULATION", 390, 430);
}


boolean overFire(){
  if(mouseX>=145 && mouseX<=195 && mouseY>=235 && mouseY<=285){
    return true;
  } else {
    return false;
  }
}

boolean resetSimulation(){
   if (mouseX>=660 && mouseX<=710 && mouseY>=400 && mouseY<=450){
    return true;
  } else{
    return false;
  }
}


void legend(){
  line(770, 0, 770, 700);
  fill(#010502);
  textSize(20);
  text("Legend", 850, 60);
  line(770, 100, 1000, 100);
  
  textSize(15);       //neutron
  text("-    Neutron", 865, 175);
  fill(#2746F0);
  ellipse(835, 170, 15, 15);
  
  textSize(15);       //proton
  fill(#010502);
  text("-    Proton", 865, 235);
  fill(#D81C1C);
  ellipse(835, 230, 15, 15);
   
  Neutron[] n;
  Proton[] p;
  p = new Proton[30];
  n = new Neutron[30];
  //font1 = createFont("Helvetica-Bold", 25);
  for (int i = 0; i<p.length; i++) {
     p[i] = new Proton(random(805,845),random(285,325));
     n[i] = new Neutron(random(805,845),random(285,325));
  }
  
  for(int i=0; i<p.length; i++){
     p[i].display();
     p[i].step();
     n[i].display();
     n[i].step();
  }
      
  fill(#26DB51);
  textSize(20);
  text("Ur-235", 791, 310);
  
  textSize(15);
  fill(#010502);
  text("-    Uranium-235", 865, 305);
  
  
  
     
  }
  
  //ellipse();
  //ellipse();
