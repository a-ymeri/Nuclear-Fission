class Neutron{
  
  PVector location;
  PVector velocity;
  float mass;
  float topSpeed = 10;
  
  
  Neutron(float x, float y){
    location = new PVector(x,y);
    velocity = new PVector(20,0);
    mass=1;
  }
  
  
  
  void display(){
    //noStroke();
    //stroke(#FFFFFF);
    fill(#2746F0);
    ellipse(location.x, location.y, 15*mass,15*mass);
    
  }
  
  void step(){
    location = new PVector(random(500,550),random(200,250));
  }
  
  void fire(){
    location.add(velocity);
  }
  
  void remove(){
    mass = 0;
  }
  
  
  
  
  
}
