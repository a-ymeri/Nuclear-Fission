class Proton{
  
  PVector location;
  PVector velocity;
  float mass;
  float topSpeed = 10;
  
  
  Proton(float x, float y){
    location = new PVector(x,y);
    velocity = new PVector(5,5);
    mass=1;
  }
  
  
  
  void display(){
    //noStroke();
    //stroke(#FFFFFF);
    fill(#D81C1C);
    ellipse(location.x, location.y, 15*mass,15*mass);
    
  }
  
  void step(){
    location = new PVector(random(500,550),random(200,250));
  }
  
  
  
  
  
}
