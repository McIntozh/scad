$fn = 64/2;
$prepareForPrint=false; // flips the bogie and add supports

$scale=1/87; // scale can be adjusted here, NEM coupling mount is only available for 1/87

mirror([0,0,$prepareForPrint?1:0])
bogie($scale);

module bogie($scale){
$distance_turntable_center_2_NEM_end=22;
/* distance_turntable_center_2_NEM_end, in mm, already scaled, measued:
        | <-----> |
 _______|_______  |
/      \|/      \=|
        |         |
*/

/* the radius of the hole in the center of the turtable, for mounting purposes. Value is given in scaled mm */
$turnTableHoleRadius=2 / $scale;
/* optional bolt of the center hole, for mounting purposes, may not be printable with the given supports, if value >0. Given in scaled mm*/
$turnTableBoltHeight=0 / $scale;

/* radius of the hole for the axis mount given in scaled mm */
$axisRadius= 1 / $scale;



scale($scale){


translate([0,-2090/2,0])
rotate([90,0,0])
    outside();

translate([0,2090/2,0])
mirror([0,1,0]) rotate([90,0,0])
    outside();

bar();
mirror([1,0,0])bar();

turntable();

if($scale==1/87)
nem_coupling();

if($prepareForPrint) print_supports();
}
}

//Including the wheels
/*
    use <../wheels/wheels.scad>
    translate([10.4,0,-1.25]){
    $axisDistance=14.05;
    wheelsAssembled();
    }
    
    translate([-10.4,0,-1.25]){
    $axisDistance=14.05;
    wheelsAssembled();
    }*/
/*rotate([90,0,0])
translate([19,-6.7,0])
ruler(8.5);*/
// /Including the wheels

module nem_coupling(){

scale(1/$scale)
//8.5mm from rail to inner NEM ceiling...
    translate([$distance_turntable_center_2_NEM_end-7.21/2,0,0.93]){
    
    difference(){
        translate([0,0,0.65])cube([7.1,5.8,4.5],center=true);
        union(){          
          cube([7.21,3.3,1.85],center=true);
          scale([1,1.2,0.75])translate([4,0,0])rotate([0,90,0])rotate([0,0,45])    cylinder(h=2,r1=1,r2=6,center=true,$fn=4);
        }
    }
       
    if($distance_turntable_center_2_NEM_end>24){
    color("red")
    translate([-7.1,0,1.5+0.65])
    cube([($distance_turntable_center_2_NEM_end)/2,5.8,1.5],center=true);
    }
    }
}

module bar(){
    translate([1664,0,-227])
    rotate([90,0,0])
    cylinder(h = 2410, r1 = 60, r2=60, center = true);
}

module turntable(){
    translate([0,0,295-75/2])
    difference(){
        union(){
            //center bar
            cube([500,2151.8,75*2],center=true);
            //center ring
            translate([0,0,$turnTableBoltHeight/2])
            cylinder(h = $turnTableBoltHeight, r = $turnTableHoleRadius+70, center = true);    
        }
        //center hole
        translate([0,0,$turnTableBoltHeight/2])
            cylinder(h = 200+$turnTableBoltHeight, r = $turnTableHoleRadius, center = true);    
    }
    
    //centerbar side parts
    translate([0,850,80])rotate([90,-48,90])scale([1,2,1])color("lime")cylinder(h=250,r=240,center=true,$fn=3);
    translate([0,-850,80])mirror([0,1,0])rotate([90,-48,90])scale([1,2,1])color("lime")cylinder(h=250,r=240,center=true,$fn=3);
    
    // left and right bars
    translate([1490,0,229])
    cube([110,2000,90],center=true);
    translate([-1490,0,229])
    cube([110,2000,90],center=true);
    
    // left and right center pieces
    translate([-896,0,257.5])
    cube([1298,500,150],center=true);
    translate([896,0,257.5])
    cube([1298,500,150],center=true);
    
}

module outside(){
    outside_half();
    mirror([1,0,0])
    outside_half();
}

module outside_half(){
    difference(){
    union(){
        translate([-1724/2,0,0]){
        translate([0.1,0,-69.1])scale([15.75,15.75,2.9])
        {
        difference(){
            frame();
            frame_cutout();
        }
        
        spring();
        axismount();
        bottom_holder();
        bottom_stuff();
        breakpads();
        }
        }
    }
    axishole();
    }
}
module spring(){
    spring_holder();
    spring_leafs();
    translate([-5,0,0])mirror([1,0,0]){
    translate([-1.3,0,0])spring_holder();
    spring_leafs();
    }
    //center block
    translate([-2.5,8.8,45])
    cube([6.3,9.5,70],center=true);
    
    //big bottomblock
    color("pink")
    translate([49.6,0,68])
    scale([1.1,6,28.5])
    rotate([180,90,0])
    linear_extrude(height=10,center=true)
    polygon([[0,0],[1,0],[1,3],[0.9,3],[0,1]]);
    
    
    //big bottomblock (side)
    color("pink")
    translate([-50.25,-6.6,55])
    rotate([0,0,-4])
    cube([7.5,13.5,40],center=true);
}

module spring_holder(){
    translate([40.7,6,45])
            rotate([0,0,33]){
            difference(){
            color("lime")roundedcube([8,23,63],center=true,1.2);
            cube([4,12,64],center=true);
            }
            for($i=[-1:2:1]){
                translate([0,8.5*$i,1.25])cylinder(h=70,r=0.8,center=true);
                translate([0,8*$i,1.25])color("red")cube([4.2,5,64],center=true);
            }
    }
}
module spring_leafs(){
    for($i=[0:1:6]){
        $offset=5;
        translate([20-$i*$offset/2,12.2-$i*1.2,45]){
            cube([39-$i*$offset,.9,60],center=true);
            if($i<6)cube([38.9-$i*$offset,1.1,55],center=true);
        }
        
    }
}

module axishole(){
    color("red")
    translate([-897,-105,-50])
    union(){
    
    cylinder(h=150,r1=$axisRadius+20,r2=$axisRadius-30,center=true);
    }
    
    //frame cutout for better inserting the axis
    color("red")
    translate([-897,-240,-300])//310
    scale([0.75,1,1])
    rotate([0,45,0])
    cube([400,150,400],center=true);
}

module axismount(){
    axis_center();
    translate([-2,-6.5,31])
        color("lime")roundedcube([23.5,14.7,48],center=true,2);
    
    translate([-10,-2.5,62])color("blue")
    rotate([0,7.2,0])
    cube([3,1.3,20],center=true);
    
    translate([5.8,-2.5,62])color("blue")
    rotate([0,-7.2,0])
    cube([3,1.3,20],center=true);
    
    translate([-10.5,-11.5,62])color("blue")
    rotate([0,7.2,0])
    cube([3,1.3,20],center=true);
    
    translate([6,-11.5,62])color("blue")
    rotate([0,-7.2,0])
    cube([3,1.3,20],center=true);
}

module axis_center(){
    //3x bolts
    axis_center_bolt();
    translate([2.7,-11.7,0])
    rotate([0,0,-120])
    axis_center_bolt();
    translate([-8.7,-8.3,0])
    rotate([0,0,120])
    axis_center_bolt();
   

    translate([-2.2,-6.7,25])
        color("white") cylinder(h=51, r=8.8, center=
false);
difference(){
union(){
    translate([-2.2,-6.7,25+51])
    color("orange")cylinder(h=12.6, r1=8.3,r2=4, center=false);
    translate([-2.2,-6.7,25+51+12.6])
    color("purple")cylinder(h=1, r=1.3, center=false);
    }
    translate([-2.2,-6.7,25+51+12.6-2])
    color("red")cylinder(h=5, r=.7, center=false);
}
}
module axis_center_bolt(){
    translate([-2.2,2.2,25+41])
    cylinder(h=15, r=.7, center=false);
    translate([-1.5,2.4,25])
    rotate([0,0,50])
    scale([1,1.5,1])
    cylinder(h=51, r=1, center=false);

    translate([-2.8,2.4,25])
    rotate([0,0,-50])
    scale([1,1.5,1])
    cylinder(h=51, r=1, center=false);
}

module bottom_holder(){
    color("green")
    translate([-2,-18.35,12]){
    linear_extrude(height = 40, convexity = 10)import("661_bottom_holder.svg", center=true);   
    
    translate([11.58,0,37])
    cylinder(h=8, r=0.7, center=false);
    translate([15.25,0,37])
    cylinder(h=8, r=0.7, center=false);
    translate([-11.58,0,37])
    cylinder(h=8, r=0.7, center=false);
    translate([-15.25,0,37])
    cylinder(h=8, r=0.7, center=false);
    }
}


module bottom_stuff(){
  //left
  color("grey")
  translate([7.8,-19.7,37])
    cube([19,6.4,11]);
  
  difference(){
   color("grey")  
  translate([18,-19.7,34.5])
    cube([37,6.4,30]);
   
  color("lime")  
  union(){
    translate([-1.55,-19.71,52])
     rotate([0,35,0])
     cube([19,7,31]);
    }
  translate([15,-13.5,50])
     rotate([10,0,-1])
     cube([41,16,19]);
  }
  
  //right
  difference(){
    translate([-30.55,-19.2,37])
    cube([19,3.5,11]);
    
    translate([-50.55,-19.5,44])
    rotate([0,40,0])
    cube([19,5,31]);
  }
}

module breakpads(){
difference(){
    color("blue")translate([-1.5,-3.5,5])
    cube([85,20,30],center=true);
    translate([-1.5,-8,10])
    cylinder(h=100,r=35.5,center=true);
}
}

module frame(){
    linear_extrude(height = 40, convexity = 10)import("661_frame.svg", center=true);
    frame_cutout_edges();
    
}

module frame_cutout_edges(){
        union(){
        translate([-31,-3,0])linear_extrude(height = 45, convexity = 10)
        scale(1.06)import("661_hole.svg", center=true);
        translate([29,-3,0])linear_extrude(height = 45, convexity = 10)mirror([1,0,0])
        scale(1.06)import("661_hole.svg", center=true);
        }
}

module frame_cutout(){
        union(){
        translate([-31,-3,0])linear_extrude(height = 45, convexity = 10)
        import("661_hole.svg", center=true);
        translate([29,-3,0])linear_extrude(height = 45, convexity = 10)mirror([1,0,0])
        import("661_hole.svg", center=true);
        }
}

module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
    $fs = 0.15;
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							sphere(r = radius);
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							rotate(a = rotate)
							cylinder(h = diameter, r = radius, center = true);
						}
					}
				}
			}
		}
	}
}

module print_supports(){
difference(){
union(){

color("orange")
for(i=[0:1:6]){
translate([1660,-920+i*100,115])
cube([150,25,550],center=true);
translate([-1660,-920+i*100,115])
cube([150,25,550],center=true);
translate([1660,920-i*100,115])
cube([150,25,550],center=true);
translate([-1660,920-i*100,115])
cube([150,25,550],center=true);
}

color("red")
for(i=[0:1:6]){
translate([1490,-950+i*100,335])
cube([150,25,100],center=true);
translate([-1490,-950+i*100,335])
cube([150,25,100],center=true);
translate([1490,950-i*100,335])
cube([150,25,100],center=true);
translate([-1490,950-i*100,335])
cube([150,25,100],center=true);
}

color("blue")
for(i=[370-335:-5:0]){
translate([300+i*35,-1035,370-i])
cube([25,155,100],center=true);
translate([-300-i*35,-1035,370-i])
cube([25,155,100],center=true);
translate([300+i*35,1035,370-i])
cube([25,155,100],center=true);
translate([-300-i*35,1035,370-i])
cube([25,155,100],center=true);
}

}
translate([0,0,482.5])
cube([4000,4000,300],center=true);
}
}
