/*
WIP of a wagon of the german type taems890 in H0 scale (1:87).

License: [Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
*/
use <floor.scad>
use <side.scad>
use <buffer.scad>
scale(1/87){

//roof radius test
translate([0,0,-310])
difference(){
translate([0,0,1500])
rotate([90,0,0])
cylinder(r=2000,h=13500,center=true,$fn=32);
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
// /roof radius test

floor();
buffers();
for(i=[-1:2:1])
translate([2650/2*i,0,100])
rotate([0,0,(i>0?0:180)])
side();


for(i=[-1,1,1])
translate([0,8500/2*-i,-640])
rotate([0,0,90*-i])
scale(87)
import("../bogie_661/661.stl");
}
