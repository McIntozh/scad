/*
WIP of a wagon of the german type taems890 in H0 scale (1:87).

License: [Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
*/

$scale=1/87;
split_roof_for_print=false;



scale($scale)
if(split_roof_for_print){
    
    difference(){
    union(){
    translate([-3195,0,0])
    rotate([0,90,0])
    roof();
    /*translate([3195,0,0])
    rotate([0,-90,0])
    roof();*/
    }
    
    translate([-4000,-8000,-2000])
    cube([8000,16000,2000]);
    }
    /*translate([-10,-13500/2,0])
    cube([20,13500,0.87]);*/
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
        s=(i==1)?0:400;
        translate([0,5*i,100+550+(s/2)]){
        cube([350,110,(1500+1100)-s],center=true);
        }
      
        union(){
            translate([0,-20*i,0])
            rotate([90,0,0])
            hull(){
                cylinder(r=105,h=100,center=true,$fn=32);
                translate([0,150,0])
                cylinder(r=105,h=100,center=true,$fn=32);
            }
            
            translate([0,-50*i,550])
            rotate([90,0,0])
            cylinder(r=50,h=100,center=true,$fn=32);
        }
      }
      
      translate([0,0,1200])
      scale([1.3,1,.5])
      rotate([0,45,0])
      cube([1500,100,1500],center=true);
    }
  }
  
  for(i=[-1:2:1])
      translate([0,(6688+12.5+70)*i,1500])
      rotate([90,0,0]) 
      cylinder(r=50,h=40,center=true);
  
  translate([0,6688+12.5,1500]){  
    
    difference(){
      rotate([90,0,0]) 
      cylinder(r=750,h=100,center=true,$fn=32);
      
      union(){
        rotate([90,0,0]) 
        cylinder(r=650,h=130,center=true,$fn=32);
        
        translate([0,0,645])
        cube([1300,150,500],center=true);
      }
    }
    translate([0,0,355])
    cube([1250,100,80],center=true);
  }
}