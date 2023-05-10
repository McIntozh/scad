/*
Wheelset in H0 (1:87) scale with customizable axis distance.
Wheels are based on the STL from https://www.thingiverse.com/thing:636783

License: Attribution 4.0 International (CC BY 4.0) 
*/

$prepareForPrint=true; //lays the parts down on the printbed
$axisDistance=14.05; // distance between the wheels / axis length
$fn= $preview?64:128;

if($prepareForPrint){
    wheelsForPrint();
}else{
    wheelsAssembled();
}

module wheelsForPrint(){
    /*translate([9,0,0])
        wheel();
    translate([-9,0,0])
        wheel();*/
    translate([0,0,1.9/2])
        axis();
}

module wheelsAssembled(){
    translate([0,-$axisDistance/2,0])
    rotate([90,0,0])
        wheel();
    translate([0,$axisDistance/2,0])rotate([-90,0,0])
        wheel();
    axis();
}

module axis(){
    union(){
    rotate([90,0,0])
    cylinder(h = $axisDistance, r1 = 1, r2=1, center = true);
    translate([0,($axisDistance+1.39)/2,0])
        cube([7.9,1.4,1.9],true);
    translate([0,-($axisDistance+1.39)/2,0])
        cube([7.9,1.4,1.9],true);
    }
}


module wheel(){
    union(){
    translate([0,0,2.37+(24.8-14.05-2.8-2.8)/4])
    cylinder(h = (24.8-14.05-2.8-2.8)/4+0.42, r1 = 1, r2=0.1, center = false);
    translate([0,0,2.37])
    cylinder(h = (24.8-14.05-2.8-2.8)/4, r1 = 1, r2=1, center = false);
    difference(){
        
        
    union(){
        
    cylinder(h = 3, r1 = 2.5, r2=2.5, center = false);
    
    color("blue")
    difference(){
    cylinder(h = 3, r=5.505, center = false);
    translate([0,0,.54])color("lime")cylinder(h = 0.708, r1=7,r2=5.5, center = false);
    cylinder(h = 3.2, r=5.2, center = false);
    translate([0,0,.54])color("lime")cylinder(h = 0.708, r1=7,r2=5.5, center = false);
    }
    
    color("green")cylinder(h = 0.54, r=7, center = false);
    
    color("pink")translate([0,0,-0.255]){
    scale(0.5) //0.385
        import("H0_wheels_print_in_half_scale_ok___03.stl", convexity=100,center=true);
    }
}
color("red") translate([0,0,0.7-0.0001])
cube([7.9+0.1,1.9+0.1,1.4],true);
}}
}


module ruler(length)
{
    mark_width = 0.125;
    mark_depth = 0.05;

    difference()
    {
        cube( [1, length, 8 ] );
        for ( i = [1:length-1] )
        {
            translate( [mark_depth, i, 0] ) cube( [1, mark_width, 3 ] );
            translate( [-mark_depth, i, 0] ) cube( [1, mark_width, 3 ] );
            if (i % 5 == 0)
            {
                translate( [mark_depth, i, 0] ) cube( [5, mark_width, 5 ] );
                translate( [-mark_depth, i, 0] ) cube( [5, mark_width, 5 ] );
            }
            if (i % 10 == 0)
            {
                translate( [mark_depth, i, 0] ) cube( [10, mark_width, 7 ] );
                translate( [-mark_depth, i, 0] ) cube( [10, mark_width, 7 ] );
            }
        }
    }
}
/*
rotate([90,0,0])
translate([0,0,0])
 ruler(5.375);
*/
