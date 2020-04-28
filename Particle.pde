class Particle{
  float mass;
  PVector location;
  PVector acceleration;
  PVector velocity;
  int topSpeed;
   
     
  Particle(){
    mass = 1;
    float y = random(305,595);
    int x = int(random(1,5))*580/5+125;
    
    float velocityX = random(-1,1);
    float velocityY = random(-1,1);
    location = new PVector(x,y);
    velocity = new PVector(velocityX,velocityY);
    acceleration = new PVector(0,0);
    velocity.normalize();
    topSpeed = 2;
  }
  Particle(PVector location, PVector velocity) {
    mass = 1;
    this.location = location;
    this.velocity = velocity;
    this.velocity.normalize();
    acceleration = new PVector(0, 0);
    topSpeed = 2;
  }
  
  void display(){
    fill(#1AD64D);
    strokeWeight(1);
    ellipse(location.x, location.y, 5*mass, 5*mass);
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
}
