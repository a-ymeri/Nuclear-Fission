/*Proton[] p;
Neutron[] n;*/
Uranium u;
Neutron n;

PImage img;
boolean fire = false;

void setup() {
  //String[] fontList = PFont.list();
  //printArray(fontList);
  img = loadImage("gun.jpg");
  size(1000, 700);
  frameRate(15);
  u = new Uranium();
  n = new Neutron(266, 220);
  
  if (mousePressed==true) {
    mouseClicked();
  }
  
  
}

void draw() {
  background(#FFFFFF);
  fireButton();
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
  } /*else if(overFire() && fire){
    fire=false;
  }*/
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

boolean overFire(){
  if(mouseX>=145 && mouseX<=195 && mouseY>=235 && mouseY<=285){
    return true;
  } else {
    return false;
  }
}
