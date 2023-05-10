/*
WIP of a wagon of the german type taems890 in H0 scale (1:87).

License: [Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)](https://creativecommons.org/licenses/by-nc/4.0/)
*/
use <buffer.scad>
floor();
module floor(){

difference(){
//plate
cube([2650,13000,200],center=true);
//plate gaps
for(j=[0:1])for(i=[0:36]){
mirror([0,j,0])
color("black")translate([0,i*175+175/2,83])cube([2550,35,35],center=true);
}
bottom_part_connectors();
buffer_holes();
}

//plate bottom rim
translate([0,0,-125]){
difference(){
cube([2650,13000,50],center=true);
cube([2650-100,13000-100,55],center=true);

}
}

bogie_pins();
ladders();
levers_pipes_tanks();
//TODO back ladders
}

module ladders(){
ladder();
translate([0,2000,0])mirror([1,0,0])ladder();
}

module ladder(){
translate([1200,-1000,-225+10]){
    translate([0,-150,0])rotate([0,10,0])cube([100,150,350],center=true);
    translate([0,150,0])rotate([0,10,0])cube([100,150,350],center=true);
    translate([16,0,-166])
    cube([250,500,75],center=true);
}
}

module levers_pipes_tanks(){
levers_left();
levers_right();
color("gray")pipes();
color("orange")
tanks();
}
module pipes(){
translate([0,250,-110])rotate([0,90,0])cylinder(h=2450,r=50,center=true);
translate([0,550,-110])rotate([0,90,0])cylinder(h=2450,r=50,center=true);
translate([0,-400,-110])rotate([0,90,0])cylinder(h=2450,r=50,center=true);
translate([-700,-250,-110])rotate([90,90,0])cylinder(h=1600,r=50,center=true);
translate([-300,0,-110])rotate([90,90,0])cylinder(h=6500,r=50,center=true);
translate([-900,500,-110])rotate([90,90,0])cylinder(h=1200,r=50,center=true);
translate([-470,1100,-110])rotate([0,90,0])cylinder(h=900,r=50,center=true);
translate([0,1520,-110])rotate([90,90,0])cylinder(h=900,r=50,center=true);
translate([290,1950,-110])rotate([0,90,0])cylinder(h=600,r=50,center=true);
translate([570,1850,-110])rotate([90,90,0])cylinder(h=240,r=50,center=true);
translate([700,590,-110])rotate([90,90,0])cylinder(h=3100,r=50,center=true);
translate([700,-1000,-150])
rotate([0,0,30])cube([700,100,100],center=true);
translate([970,-2000,-110])rotate([90,90,0])cylinder(h=2400,r=50,center=true);
translate([400,20,-75])rotate([0,0,10])scale([8,2,1])cylinder(h=200,r=50,center=true,$fn=8);
translate([100,2750,-110])rotate([90,90,0])cylinder(h=1000,r=50,center=true);

translate([400,2200,-75])rotate([0,0,-10])scale([8,2,1])cylinder(h=200,r=50,center=true,$fn=8);
translate([100,-1625,-110])rotate([90,90,0])cylinder(h=3250,r=50,center=true);

}


module tanks(){
translate([-700,-1400,-250])rotate([90,90,0]){
cylinder(h=1250,r=200,center=true);
for(i=[-1:2:1])
translate([0,0,400*i])cylinder(h=100,r=225,center=true);
}

translate([-900,-80,-170])rotate([90,90,0]){
cylinder(h=450,r=100,center=true);
}

translate([700,1500,-250])rotate([90,90,0]){
cylinder(h=550,r=200,center=true);
translate([0,0,400])cylinder(h=250,r1=200,r2=100,center=true);
translate([0,0,600])cylinder(h=200,r=100,center=true);
translate([-100,0,500])rotate([0,0,45])cylinder(h=400,r=130,center=true,$fn=4);
}

translate([-550,1100,-150])
cube([300,300,100],center=true);

translate([100,-650,-95]){
difference(){
sphere(r=200);
translate([0,0,100])
cube([400,400,200],center=true);
}}
}

module levers_right(){
mirror([1,0,0])
levers_left();
}
module levers_left(){
//small yellow
translate([1200,250,-225+1]){
    color("black")cube([100,250,250],center=true);
    color("white")translate([50,0,-50])cube([100,250,150],center=true);
    translate([70,10,0])rotate([-10,0,0])
    color("yellow")cube([100,70,225],center=true);
}
//medium red
translate([1200,550,-225+1]){
    color("black")cube([100,250,250],center=true);
    color("white")translate([50,0,-50])cube([100,250,150],center=true);
    translate([70,10,-115])rotate([0,0,0])
    color("red")cube([100,70,150],center=true);
}

//large red (brake force adjust)
translate([1200,-400,-285+1]){
    color("white")cube([100,250,250],center=true);
    color("white")translate([0,0,125])cube([100,500,125],center=true);
    translate([70,10,0])rotate([-10,0,0])
    color("red")cube([100,70,225],center=true);
}

}

module bogie_pins(){

for(i=[-1:2:1]){
translate([0,8500/2*-i,65-100]){
    difference(){
    union(){
    color("red")translate([0,0,-270])cylinder(h=550,r=165,center=true);
    color("blue")translate([0,0,-160])cylinder(h=200,r=400,center=true);
    color("lime")translate([0,0,-525])cylinder(h=160,r1=165,r2=200,center=true);
    }
    color("pink")translate([0,0,-470])scale([10,1,1])rotate([0,0,45])cylinder(h=300,r1=120,r2=10,center=true,$fn=4);
    }
    }
}
}

module bottom_part_connectors(){
color("white"){
bottom_2_side_part_connector();
mirror([1,0,0])
bottom_2_side_part_connector();
}
}
module bottom_2_side_part_connector(){
translate([1301,0,0])
cube([50,12002,52],center=true);
}

