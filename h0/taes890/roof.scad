
split_roof_for_print=true;

if(split_roof_for_print){
    
    difference(){
    union(){
    translate([-3195,0,0])
    rotate([0,90,0])
    roof();
    translate([3195,0,0])
    rotate([0,-90,0])
    roof();
    }
    
    translate([-4000,-8000,-2000])
    cube([8000,16000,2000]);
    }
    translate([-10,-13500/2,0])
    cube([20,13500,0.87]);
}else
    roof();


module roof(){




color("brown")
translate([0,0,-310]){
 roof_connector();

 difference(){
  translate([0,0,1500])
  rotate([90,0,0])
  cylinder(r=2000,h=13500,center=true,$fn=32);
  
  union(){
    translate([0,0,1500-100])
    rotate([90,0,0])
    cylinder(r=2000,h=13200+101,center=true,$fn=32);
  
    translate([0,0,500]){
      cube([4000,13501,4000],center=true);
      translate([2500,0,2200])
      cube([2000,13501,1000],center=true);
      translate([-2500,0,2200])
      cube([2000,13501,1000],center=true);
      translate([0,0,2000])
      cube([4000,13251,500],center=true);
    }
  }
}

}

}



module roof_connector(){

    
  for(i=[-1:2:1]){
      
      translate([0,(6688+12.5)*i,1500]){
      difference(){
        translate([0,5*i,100+550])
        cube([350,110,1500+1100],center=true);
      
        translate([0,-50*i,0])
        rotate([90,0,0])
        cylinder(r=100,h=100,center=true,$fn=32);
      }
      
      translate([0,0,1200])
      scale([1.3,1,.5])
      rotate([0,45,0])
      cube([1500,100,1500],center=true);
    }
  }
  
  
  translate([0,6688+12.5,1500]){
  
    translate([0,70,0])
    rotate([90,0,0]) 
    cylinder(r=50,h=40,center=true);
    
    difference(){
      rotate([90,0,0]) 
      cylinder(r=750,h=100,center=true);
      
      union(){
        rotate([90,0,0]) 
        cylinder(r=650,h=130,center=true);
        
        translate([0,0,700])
        cube([1300,150,500],center=true);
      }
    }
    translate([0,0,350])
    cube([1250,100,50],center=true);
  }
}