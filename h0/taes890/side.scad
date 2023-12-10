/*
WIP of a wagon of the german type taems890 in H0 scale (1:87).

License: [Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
*/
side();
//scale(1/87)side();
module side(){
difference(){
    translate([0,0,1150]){
    cube([100,13000,2300],center=true);
    /*difference(){

        cube([100,13000,2300],center=true);

        translate([0,0,-50])doorhole();
    }
    */
    }
    side_2_fron_and_back_part_connector();
}
vertical_stipes();
top_stripe();//TODO eigentlich top roof part
bottom_stripe();
clipboard();
info_plate();
little_knobby_thing_on_the_right();
anchors();
doorstopper();
translate([90,0,1150])door();
door_guide();
pipe_box();






translate([25,0,-125]){
cube([50,13000,250],center=true);
side_part_connectors();
}
//TODO
//front and back part connectors

}

module door(){
color("grey"){
 difference(){
   translate([0,0,-50])
   cube([80,3000,2200],center=true);
   
   for(i=[-1:1])
   translate([30,0,650*i])
   cube([40,2800,550],center=true);
   translate([30,0,-1075])
   cube([40,2800,150],center=true);
 }
 
 
}
//3x door handles
union(){
    translate([17,1300,80])
    door_handle();
    translate([17,-1300,80])mirror([0,1,0])
    door_handle();
    translate([17,-1300,-660])mirror([0,1,0])
    door_handle();
}
door_bottom_panel();

translate([40,-1360,-560])
door_lock();

door_front_stopper();
for(i=[-1:2:1])
 translate([0,850*i,0])
 door_bottom_roller();
}

module door_handle(){
color("snow")rotate([90,0,-90]){
    translate([-100, -240, 0])
        rotate([90, 0, 90]) cylinder(r=10, h=100);
    rotate_extrude(angle=90, convexity=10)
       translate([40, 0]) circle(10);
    translate([40, 0, 0])
        rotate([90, 0, 0]) cylinder(r=10, h=200);
    translate([0,-200,0])
        rotate_extrude(angle=-90, convexity=10)
        translate([40, 0]) circle(10);
    translate([-100, 40, 0])
        rotate([90, 0, 90]) cylinder(r=10, h=100);
 }
}

module door_lock(){
color("brown"){
translate([-55, -185, 40])
rotate([0,90,0]){
 cylinder(r=30, h=70);
 translate([0, 0, 58])
 cylinder(r1=25,r2=15, h=20);
 }
 
 //translate and scale only for better printability
 translate([-10,0,0])scale([2.5,1,1])// /translate and scale only for better printability
rotate([90,-90,90]){
    translate([-60, -240, 0])
        rotate([90, 0, 90]) cylinder(r=10, h=60);
    translate([40, 200, 0])
        rotate([90, 0, 0]) cylinder(r=10, h=400);
    translate([0,-200,0])
        rotate_extrude(angle=-90, convexity=10)
        translate([40, 0]) circle(10);
 }
 
 translate([0, 70, 0])
 cube([70,400,30],center=true);

 translate([-25, -195, 42])
 cube([30,90,75],center=true);
}
}

module door_bottom_panel(){
color("grey"){
translate([0,-25, -1250]){

  cube([50,2950,250],center=true);
 }
}
}

module door_front_stopper(){
color("orange"){
translate([40, -1200, -1040]){

  cube([50,70,200],center=true);
  translate([0, 0, -85])
  cube([50,50,200],center=true);
 }
}
}

module door_bottom_roller(){
color("lightblue"){
translate([35, 0, -1200]){
  cube([50,180,80],center=true);
  translate([0, 0, 5])
  cube([50,240,45],center=true);
  
  translate([0, 0, 38])
  cube([50,250,10],center=true);
  for(i=[-1:2:1])
  translate([-5, 100*i, 45])
  cube([50,15,20],center=true);
  
  for(i=[-1:2:1]){
   translate([10, 100*i, 5])
   rotate([0,90,0]){
    cylinder(r=15,h=40,center=true);
    cylinder(r=7,h=50,center=true);
   }
  }
 }
}
}

module door_guide(){
color("pink"){
//rail
translate([90,1550,-60])
cube([90,6100,50],center=true);

//lower holders
for(c=[0:5])
translate([70,1500+600*c,-170])
rotate([-90,0,0]){
translate([49,-70-12.5,50])
cube([57,15,100],center=true);
for(i=[-1:2:1])
translate([24,-49,i==1?0:75])
rotate([0,0,-30])
cylinder(r=57,h=25,$fn=3);
}
}
}

module doorstopper(){
color("lightgreen")translate([70,4725,800]){
cube([50,250,300],center=true);

translate([74,-100-17.5,0])
cube([100,25,150],center=true);

for(i=[-1:2:1])
translate([24,-49,i==1?50:-75])
rotate([0,0,-30])
cylinder(r=115,h=25,$fn=3);

translate([74,-130,0])
rotate([90,0,0])
cylinder(r=50,h=60);
}
}

/*module doorhole(){
 cube([200,2700,2100],center=true);
}*/

module vertical_stipes(){
for(i=[-9:9])if(i!=0)
translate([70,600*i+((2700/2-400)*sign(i)+(i==9*sign(i)?120*sign(i):0)),1050-7])
 color("red")cube([50,150,2500-7],center=true);
}

module top_stripe(){
color("red")difference(){
translate([70,0,2222])
rotate([90,0,0])
cylinder(h=13000,r=80,center=true,$fn=7);
translate([100,0,2160])
cube([120,13000+2,100],center=true);
}
}

module bottom_stripe(){
color("red")
translate([70,0,-224])
cube([50,13000+4+86,50],center=true);

}

module clipboard(){
color("lightblue")translate([50,-5450,230]){
difference(){

cube([40,370,300],center=true);
translate([30,0,0])cube([40,350,280],center=true);
for(x=[0:4])
for(y=[0:3])
translate([10,x*70-140,y*70-105])
cube([40,60,60],center=true);
}
translate([0,0,-160])cube([30,30,30],center=true);

}
}



module anchors(){
for(i=[-1:2:1])
translate([40,6050*sign(i),0]){
anchor();
color("black")translate([-150,0,0])scale([2,1,1])
anchorhook();
}

}
module anchor(){
color("orange"){

hull(){
translate([40,0,0])
cube([20,320,120],center=true);
translate([110,0,0])
cube([10,140,80],center=true);
}

anchorhook();
}
}
module anchorhook(){
translate([105,0,-85]){
difference(){
    union(){
    cube([30,120,230],center=true);
    hull()
    for(i=[-1:2:1])
    translate([0,50*sign(i),-70])
    rotate([90,0,90])
    cylinder(r=50,h=30,center=true);
    }

    for(i=[-1:2:1]){
        translate([0,65*sign(i),-50])
        rotate([90,0,90])
        cylinder(r=40,h=40,center=true);
        translate([0,67*sign(i),-0])rotate([25*-sign(i),0,0])cube([40,40,100],center=true);
    }
}}
}

module info_plate(){
color("pink")translate([80,-4850,230]){
cube([60,600,800],center=true);
for(i=[0:1])
for(j=[0:2])
translate([35,520*i-260,370*j-370])
rotate([0,90,0])cylinder(r=20,h=10,center=true);
}
}

module pipe_box(){
color("lightyellow")translate([89,-4250,200]){

cube([80,280,130],center=true);
translate([0,0,60])cube([110,280,10],center=true);
for(i=[-1:2:1]){
 translate([0,90*i,40])cube([110,30,30],center=true);
 //holder+screws
 translate([-30,170*i,-10]){cube([20,70,120],center=true);
 rotate([0,90,0])cylinder(r=15,h=35,center=true);
}
}
//pipes
translate([-30,-100,-200])
    pipe_box_pipe();
translate([-30,-50,-200])
    pipe_box_pipe();
translate([-30,50,-200])
    pipe_box_pipe();
        
//handle
translate([10,0,70]){cube([120,40,10],center=true);
cylinder(r=35,h=10,center=true);
}
}
}

module pipe_box_pipe(){
    translate([40,0,75])
    cylinder(r=13,h=150,center=true);

    rotate([0,90,90])
    rotate_extrude(angle=-90, convexity=10)
    translate([40, 0]) circle(13);

    translate([-5,0,-40])
    rotate([0,90,0])
    cylinder(r=13,h=15,center=true);
}

module little_knobby_thing_on_the_right(){
color("lightgray")translate([90,5750,260])
cube([80,100,100],center=true);
}

module side_part_connectors(){
color("black"){
side_2_bottom_part_connector();
}
}
module side_2_bottom_part_connector(){
translate([-45,0,20])
cube([45,12000,50],center=true);
}

module side_2_fron_and_back_part_connector(){

for(i=[-1:2:1]){
translate([-45,6450*i,1220])
cube([45,45,2600],center=true);
}
}
