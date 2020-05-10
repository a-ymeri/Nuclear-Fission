class Uranium{
  Neutron[] n;
  Proton[] p;
  float mass;
  boolean remove = false;
  
  PFont font1;
  
  
  
  Uranium(){
    p = new Proton[30];
    n = new Neutron[30];
    font1 = createFont("Helvetica-Bold", 25);
    for (int i = 0; i<p.length; i++) {
       p[i] = new Proton(random(500,550),random(200,250));
       n[i] = new Neutron(random(500,550),random(200,250));
    }
  }
  
  void display(){
    if(!remove){
      for(int i=0; i<p.length; i++){
        p[i].display();
        p[i].step();
        n[i].display();
        n[i].step();
      }
      
      fill(#26DB51);
      textFont(font1);
      text("Ur-235", 480, 230);
    }
    
  }
  
  void step(){
  }
  
  void splitAtom(Neutron n){
    if(n.location.x>=530){
      n.remove();
      remove = true;
      createBarium();
      createKrypton();
    }
    
  }
  
  void createBarium(){
    /*p = new Proton[10];
    n = new Neutron[10];
    for (int i = 0; i<p.length; i++) {
       p[i] = new Proton(random(500,550),random(200,250));
       n[i] = new Neutron(random(500,550),random(200,250));
    }
    for(int i=0; i<p.length; i++){
       p[i].display();
       p[i].step();
       n[i].display();
       n[i].step();
       
    }*/
    
  }
  
  void createKrypton(){
  }
  
  
  
  
  
  
  
}
