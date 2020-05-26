class Particle{
  float mass;
  PVector location;
  PVector acceleration;
  PVector velocity;
  int topSpeed;


  Particle(int conX,int conY, int conW, int conH){
    mass = 1;
    float y = random(conY+10,conY+conH-10);
    int x = int(random(1,5))*conX/5+conW;

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

  void bounceOnEdges(int conX, int conY, int conW, int conH){
    if(location.x<conX+5 || location.x>conX+conW-5) velocity.x *= -1;
    if(location.y<conY+5 || location.y>conY+conH-5) velocity.y *= -1;
  }
}
