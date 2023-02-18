/*
Assembly helper for th H0 wheelset.
Glue the wheels to the axis, than insert into this helper to ensure everything keeps straight while drying

*/

$axisDistance=14.05;// should be adjusted if you changed the axis distance in the wheels file
$fn = 32;
use <wheels.scad>;


translate([7.5,0,-6.5])cube([5,22,2],center=true);
translate([-7.5,0,-6.5])cube([5,22,2],center=true);
translate([0,8.5,-6.5])cube([20,5,2],center=true);
translate([0,-8.5,-6.5])cube([20,5,2],center=true);

difference(){

cube([20,22,15],center=true);

union(){

scale([1.02,1.02,9000]){
translate([0,-$axisDistance/2,0])
rotate([90,90,0])
    wheel();
translate([0,$axisDistance/2,0])rotate([-90,90,0])
    wheel();
scale([1.1,1.2,1.1])
    axis();
}
translate([0,-9.3,0])cube([11,2,87],center=true);
translate([0,9.3,0])cube([11.2,2,87],center=true);
}

cube([22,12.5,17],center=true);

}
