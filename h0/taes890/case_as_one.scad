/*
WIP of a wagon of the german type taems890 in H0 scale (1:87).

License: [Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
*/

use <side.scad>
use <front_back.scad>

$scale=1/87;

mirror([0,0,1])
scale($scale)
case();


module case(){
for(i=[-1:2:1])
translate([2650/2*i,0,100])
rotate([0,0,(i>0?0:180)])
side(false);

translate([0,13000/2,2300/2+100])
mirror([0,1,0])
front(false);

translate([0,-13000/2+15,2300/2+100])
back(false);
}
