use <floor.scad>
use <side.scad>
scale(1/87){

floor();
for(i=[-1:2:1])
translate([2650/2*i,0,100])
mirror([1-i,0,0])
side();


for(i=[-1,1,1])
translate([0,8500/2*-i,-615])
rotate([0,0,90*-i])
scale(87)
import("../bogie_661/661.stl");
}