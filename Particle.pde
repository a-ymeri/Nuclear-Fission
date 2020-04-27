class Particle{
  float mass;
  PVector location;
  PVector acceleration;
  PVector velocity;
  //char charge;
  int topSpeed;
  
  Particle(){
    location = new PVector(random(125,815), random(305,590));
    velocity = new PVector(random(5), random(5));
    acceleration = new PVector(0,0);
    topSpeed = 2;
    mass = 1;
  }
  
  Particle(PVector location, PVector velocity) {
    mass = 1;
    this.location = location;
    this.velocity = velocity;
    acceleration = new PVector(0, 0);
    topSpeed = 2;
  }
  
  void display(){
    fill(#1AD64D);
    strokeWeight(1);
    ellipse(location.x, location.y, 5*mass, 5*mass);
  }
  
  void displayButton(){
    rect(600, 100, 50, 50);
  }
  
  void step(){
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    acceleration = new PVector(0,0);
  }
  
  void bounceOnEdges(){
    if(location.x<125 || location.x>815) velocity.x *= -1;
    if(location.y<305 || location.y>595) velocity.y *= -1;
  }
  
  void getAbsorbed(){
  }
}
