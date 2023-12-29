/*
WIP of a wagon of the german type taems890 in H0 scale (1:87).

License: [Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
*/

$scale=1/87;



scale($scale){
    translate([-1500,0,0])
    front();
     
    translate([1500,0,0])
    back();
}
 
 module front(){
 difference(){
    cube([2750,120,2300],center=true);
    translate([1350,60,0])
    cube([60,100,2400],center=true);
    translate([-1350,60,0])
    cube([60,100,2400],center=true);
 }
 front_back_bars();
 front_back_roof_pin();
 front_back_roof_snap();
 front_back_5degree_bars();
 spring_mechanism();
 
bottom_mechanics_box();
wheel_handle();
mirror([1,0,0])
wheel_handle();
 
}
 
 module back(){
 difference(){
    cube([2750,120,2300],center=true);
    translate([1350,60,0])
    cube([60,100,2400],center=true);
    translate([-1350,60,0])
    cube([60,100,2400],center=true);
 }
 front_back_bars();
 front_back_roof_pin();
 front_back_roof_snap();
 front_back_5degree_bars();
 spring_mechanism();
 
  small_handle();
 large_handle();
 mirror([1,0,0]){
 small_handle();
 large_handle();
 }
 }
 
 module front_back_roof_pin(){
 color("lightgreen")
translate([0,-112,-60])
rotate([90,0,0])
cylinder(r=100,h=225,center=true,$fn=32);
 }
 
 module front_back_roof_snap(){
 color("lightgreen")
translate([0,-112,450])
rotate([90,0,0])
cylinder(r=40,h=200,center=true,$fn=32);
 }
 
 module front_back_bars(){
 for(i=[-1:2:1])
 translate([630*i,0,0])
   front_back_v_bar();
 front_back_h_bar();
 }
 module front_back_v_bar(){
 color("white")
 translate([0,-90,-875]){
 difference(){
 cube([200,100,1100],center=true);
 translate([0,-130,-550])
 rotate([40,0,0])
 cube([250,250,250],center=true);
 }
 }
 }
 
 module front_back_h_bar(){
 color("orange")
 translate([0,-100,-240]){
 difference(){
 cube([2750,120,170],center=true);
 
 for(i=[-1:2:1])
 translate([1350*i,-130,0])
 rotate([0,0,30*i])
 cube([250,250,300],center=true);
 }
 }
 }
 
 module front_back_5degree_bars(){
 front_back_5degree_bar();
 mirror([1,0,0])
 front_back_5degree_bar();
 } 
 module front_back_5degree_bar(){
 color("lightblue")
 translate([0,-100,400]){
 difference(){
 translate([2750/4-6,0,0])
 rotate([0,5,0])
 cube([2750/2+5,120,170],center=true);
 
 
 translate([1350,-130,0])
 rotate([0,0,30])
 cube([250,250,300],center=true);
 }
 }
 }
 
 module spring_mechanism(){
 translate([0,0,-50]){
 spring_part();
 lower_cable_part();
 spring_cable_connector();
 mirror([1,0,0]){
  lower_cable_part();
  spring_cable_connector();
 }
 translate([940-55-10,0,0])
 spring_part();
 }
 }
 
 module spring_cable_connector(){
 color("lightgreen")
 translate([0,-60,0])
 hull(){
 translate([1200,0,650])
 rotate([90,0,0])
 cylinder(r=35,h=60,center=true,$fn=32);
 
 translate([1150,0,900])
 rotate([90,0,0])
 cylinder(r=50,h=60,center=true,$fn=32);
 
 translate([980,0,1090])
 rotate([90,0,0])
 cylinder(r=35,h=60,center=true,$fn=32);
 }
 
 color("white")
 hull(){
 translate([1100,-70,900])
 rotate([90,0,0])
 cylinder(r=50,h=70,center=true,$fn=32);
 translate([960,-70,980])
 rotate([90,0,0])
 cylinder(r=10,h=70,center=true,$fn=32);
 translate([960,-70,820])
 rotate([90,0,0])
 cylinder(r=10,h=70,center=true,$fn=32);
 }
 
 translate([1100,-80,900])
 rotate([90,0,0])
 cylinder(r=35,h=75,center=true,$fn=32);
 }
 
 module spring_part(){
 translate([-1020,-60,900]){
 
 for(i=[1:1:20])
 translate([55*i,0,0])
 rotate([0,90+10,0])
 cylinder(h=34,r=90,center=true);
 
 translate([575,0,0])
 rotate([0,90,0])
 cylinder(h=1050,r=70,center=true);
  }
  
 }
 
 module lower_cable_part(){
 color("pink")
 translate([600,-80,650])
 cube([1300,50,30],center=true);
 
 color("pink")
 translate([1200,-80,650])
 cube([300,50,80],center=true);
 
 for(i=[-1:2:1])
 translate([1270+(i*35),-80-10,650])
 rotate([90,0,0])
 cylinder(r=25,h=60,center=true,$fn=32);
 
 translate([1090,-80-10,650])
 rotate([90,0,0])
 cylinder(r=25,h=60,center=true,$fn=32);
 }
 
module small_handle(){
r=20;
translate([-800, -63, -50])
scale([1,2.5,1])
color("snow")rotate([0,90,-90]){
    translate([-100, -240, 0])
        rotate([90, 0, 90]) cylinder(r=r, h=100);
    rotate_extrude(angle=90, convexity=10)
       translate([40, 0]) circle(r);
    translate([40, 0, 0])
        rotate([90, 0, 0]) cylinder(r=r, h=200);
    translate([0,-200,0])
        rotate_extrude(angle=-90, convexity=10)
        translate([40, 0]) circle(r);
    translate([-100, 40, 0])
        rotate([90, 0, 90]) cylinder(r=r, h=100);
 }
}

module large_handle(){
r=20;
translate([-1300, -63-70+50, 50])
color("snow")rotate([90,0,-90]){
    translate([-100, -240-800, 0])
        rotate([90, 0, 90]) cylinder(r=r, h=100);
    rotate_extrude(angle=90, convexity=10)
       translate([40, 0]) circle(r);
    translate([40, 0, 0])
        rotate([90, 0, 0]) cylinder(r=r, h=1000);
    translate([0,-1000,0])
        rotate_extrude(angle=-90, convexity=10)
        translate([40, 0]) circle(r);
    translate([-100, 40, 0])
        rotate([90, 0, 90]) cylinder(r=r, h=100);
 }
}

module bottom_mechanics_box(){

translate([0,-100,-950])
cube([1300,200,200],center=true);

color("lightgreen")
 translate([0,-60,0])
 hull(){
 translate([0,0,-700])
 rotate([90,0,0])
 cylinder(r=35,h=60,center=true,$fn=32);
 
 
 translate([1000,0,-900])
 rotate([90,0,0])
 cylinder(r=100,h=60,center=true,$fn=32);
 
 translate([0,0,-1100])
 rotate([90,0,0])
 cylinder(r=35,h=60,center=true,$fn=32);
 
 translate([-1000,0,-900])
 rotate([90,0,0])
 cylinder(r=100,h=60,center=true,$fn=32);
 }
}

module wheel_handle(){
color("orange")
 translate([-1000,-80,-900]){
 cube([80,55,300],center=true);
 rotate([90,0,0]){
   cylinder(r=20,h=75,center=true,$fn=32);
   difference(){
     cylinder(r=200,h=70,center=true,$fn=32);
     cylinder(r=150,h=75,center=true,$fn=32);
   }
 }
 }
}