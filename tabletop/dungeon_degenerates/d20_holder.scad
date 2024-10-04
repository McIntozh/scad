/*
Generator for a D20 dice holder, with customizable dice count (1-10).

Author: Dennis Schwarz (blacknpebble@gmail.com)
License: Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) https://creativecommons.org/licenses/by-nc-sa/4.0/
For commercial use please contact the author
*/

$fn=64;
/* [Global] */
//Number of cups
dice_count=5; //[1:10]

/* [Hidden] */
offset=25.5; 

translate([-(28-1)/2,0,0]){
  for(i=[0:1:dice_count-1]){
    translate([-offset*i,0,0])
      cup();
  }
}


module cup(){
  difference(){
    hull(){
      cylinder(h=10-1,d=28-1,center=true);
      translate([0, 0, 5-.5])
        rotate_extrude()
          translate([(28-1)/2-.5, 0])
            circle(r=0.5);
    }
    translate([0,0,10.75])
      rotate([0,-31.7,18])
        icosahedron(13.5);
  }
  translate([0,0,-4])
    cylinder(h=2,d=30-1,center=true);
}


// create an icosahedron by intersecting 3 orthogonal golden-ratio rectangles
phi=0.5*(sqrt(5)+1); // golden ratio
module icosahedron(edge_length) {
   st=0.0001;  // microscopic sheet thickness
   hull() {
       cube([edge_length*phi, edge_length, st], true);
       rotate([90,90,0]) cube([edge_length*phi, edge_length, st], true);
       rotate([90,0,90]) cube([edge_length*phi, edge_length, st], true);
   }
}