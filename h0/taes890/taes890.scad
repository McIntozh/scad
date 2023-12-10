/*
WIP of a wagon of the german type taems890 in H0 scale (1:87).

License: [Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
*/
use <floor.scad>
use <side.scad>
use <front_back.scad>
use <roof.scad>
use <buffer.scad>

$fn=32;


scale(1/87){


roof();


floor();
buffers();
for(i=[-1:2:1])
translate([2650/2*i,0,100])
rotate([0,0,(i>0?0:180)])
side();

translate([0,13000/2,2300/2+100])
mirror([0,1,0])
front();

translate([0,-13000/2+15,2300/2+100])
back();


for(i=[-1,1,1])
translate([0,8500/2*-i,-640])
rotate([0,0,90*-i])
scale(87)
import("../bogie_661/661.stl");
}
