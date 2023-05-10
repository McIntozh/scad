/*
Foot for IKEA Vika table leg.

License: Attribution 4.0 International (CC BY 4.0) 
*/
$fn=64;

difference(){
union(){
cylinder(h=20,d=48,center=false);
translate([0,0,20])
cylinder(h=5,d1=48,d2=46,center=false);
cylinder(h=9,d1=49,d2=52,center=false);
}
translate([0,0,10])
cylinder(h=10,d=15.2,center=false,$fn=6);
translate([0,0,14])
cylinder(h=22,d=25,center=false);
cylinder(h=32,d=7.5,center=true);
}
