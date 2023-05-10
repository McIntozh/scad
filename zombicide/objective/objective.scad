/*
Miniature road case, originally created as objective marker for the Zombicide board game.
Due to fine details, it may also look good if scaled up.

License: [Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
*/
$fn=32;

difference(){
union(){
cube([20,20,20],center=true);

for(f=[0:1:3])
rotate([0,0,90*f]){
for(i=[-1:2:1]){
translate([9.15,9.15,9.3*i]){
    mirror([0,0,i<0?1:0]){
    difference(){
        sphere(r=1.6);
        translate([0,0,1.6])
        cube([40,40,1],center=true);
    }
    if(i>0){
    translate([-2,-1,0.95])
    corner_fixation();
    }
    
    translate([.15,0,0])
    rotate([90,0,90])
    translate([-2,-1,0.95])
    corner_fixation();
    
    translate([0,0.15,0])
    rotate([0,90,90])
    translate([2,1,0.95])
    rotate([0,0,180])
    corner_fixation();
    }
}

}
translate([9.25,9.25,0])
cube([2,2,19],center=true);

for(r=[0:1])
translate([9.225+(r==1?0:1),9.225+(r==1?1:0),-3])
rotate([90*r,90,0])
nut();
}

for(m=[0:1:1])mirror([0,0,m])
for(f=[0:1:3])rotate([0,0,90*f])
translate([9.25,0,9.25]){
cube([2,19,2],center=true);
for(r=[0:1])rotate([0,90*r,0])
for(i=[-1:2:1])
translate([0,4*i,.975])
nut();
}

for(f=[0:1:3])rotate([0,0,90*f]){
translate([9.25,0,4.5]){
cube([2,19,4],center=true);
for(i=[-1:2:1])
for(j=[-2:1:2])
if(j!=0){
translate([0.95,9.25*i,j])
rotate([90,0,90])
nut();}
}
}


//handle-stuff
hull(){
for(i=[-1:2:1])
for(j=[-1:2:1])
translate([0,2.5*i,1.5*j])
rotate([90,0,90])cylinder(r=1,h=20.2,center=true);
}
for(m=[0:1:1])
mirror([m,0,0]){
for(i=[-1:2:1])
for(j=[-1:1:1])
translate([10.1,3*i,1.7*j])
rotate([0,90,0])
nut();
for(i=[-1:2:1])
for(j=[-1:2:1])
translate([10.1,1*i,2*j])
rotate([0,90,0])
nut();
}
// /handle-stuff

//lock stuff
for(m=[0:1:1])mirror([0,m,0])
for(lr=[-1:2:1]){

hull(){
translate([3.2*lr,0,2.20])
for(i=[0:1:1])
for(j=[0:1:1])
translate([i*2.7*lr,0,j*3.7])
rotate([0,90,90])cylinder(r=1,h=20.7,center=true);
}
for(j=[-1:1:1])
for(i=[0:1:1])
translate([4.5*lr+(1.5*j),10.3,6.45-4.85*i])
rotate([0,90,90])
nut();

for(x=[0:1:1])
for(y=[0:1:1])
translate([6.45*lr-x*3.85*lr,10.3,5.2-y*1.3])
rotate([0,90,90])
nut();

}
// /lock stuff


}

union(){
for(f=[0:1:3])rotate([0,0,90*f]){
translate([11.2,0,4.5])
cube([2,25,0.1],center=true);
}
}

translate([0,0,-12.5])
cube([25,25,5],center=true);

//handle holes
for(i=[-1:2:1])
translate([-10*i,0,0])
cube([.5,5,3],center=true);
//lock holes
for(j=[-1:2:1])for(i=[-1:2:1])
translate([4.5*j,-10.4*sign(i),4])
cube([3,.6,4],center=true);

//infill hole
translate([0,0,0])
rotate([0,0,45])cylinder(r1=12,r2=2,h=16,center=true,$fn=4);
translate([0,0,-10])
cube([10,10,10],center=true);


}


module nut(){
difference(){
cylinder(r=0.4,h=0.2,center=true);
cylinder(r=0.2,h=0.3,center=true);
}
}

module corner_fixation(){
rotate([0,0,-45]){
translate([0,0,-0.1])cylinder(r=0.6,h=0.4,center=true);
translate([0,0,0.05])nut();
translate([1,0,0]){
translate([0,0,-0.1])cylinder(r=0.6,h=0.4,center=true);
translate([0,0,0.05])nut();
}
translate([.5,1,-0.1])
cube([1.8,2,0.4],center=true);

}
}

//handle inside
for(i=[-1:2:1])
translate([9.5*i,0,0])
handle();

//lock inside
for(m=[0:1:1])mirror([0,m,0])
for(i=[-1:2:1]){
translate([4.5*i,10,4])
cube([1.25,.4,4],center=true);
translate([4.5*i,10.1,3])
cube([2.2,.4,1.5],center=true);
}

module handle(){
translate([0,0,-.9])cube([1,3.5,.5],center=true);
translate([0,1.5,.3])cube([1,.5,2.5],center=true);
translate([0,-1.5,.3])cube([1,.5,2.5],center=true);
}
