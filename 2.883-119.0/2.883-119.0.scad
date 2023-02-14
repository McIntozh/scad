//Filter Element 2.883-119.0 for Kärcher 555c floor cleaner
//EAN 4002667044669
//License: Attribution 4.0 International (CC BY 4.0) 

$fn= $preview?32:64;
$holes=false;
$layDown=true;

if($layDown){
    difference(){
        translate([0,0,0]){ 
            rotate([125,0,0])
                rotate([0,90,180]){
                    model();
                }
            translate([0,25,0])
                rotate([125-180,0,0])
                    rotate([0,90,180])
                        model();
        }
        translate([-15,-18,-13])
            cube([30,60,13],center=false);
    }
}else{
    translate([0,0,13.5]){
        model();
    }
}

module model(){
color("lightblue")
difference() {
    cylinder(r = 20/2, h = 27, center = true);
    translate([0,0,1.2]) {
        cylinder(r=19.5/2-0.75,h=27,center=true);
    }
    /*for(i=[0:90:360]){
        rotate([0,0,i])
        thinner();
    }*/
    for(j=[-11:1:9]){
        if($holes){
             for(i=[0:3:75])
             translate([0,0,j]){
                rotate([0,0,7+i])
                    hole();
                rotate([0,0,97+i])
                    hole();
                rotate([0,0,187+i])
                    hole();
                rotate([0,0,277+i])
                    hole();
            }
        }else{
            translate([0,0,j]){
                rotate([0,0,8])
                longHole();
                rotate([0,0,98])
                longHole();
                rotate([0,0,188])
                longHole();
                rotate([0,0,278])
                longHole();
            }
        }
    }
}


topInnerCylinder();

outerGuides();
innerGuides();

wings();



}

module outerGuides()
color("orange"){
for(i=[0:90:359]){
    rotate(i,[0,0,1]){
        translate([10.2,0,-2]){
            cube([0.75,2,23],center=true);
        }
    }
}
}

module innerGuides()
color("lime"){
for(i=[0:45:135]){
    rotate(i,[0,0,1]){
        translate([8.75,0,-1.9]){
            cube([0.5,2,23],center=true);
        }
        translate([-8.75,0,-1.9]){
            cube([0.5,2,23],center=true);
        }
    }
}
}

module topInnerCylinder()
color("red"){
translate([0,0,-10.4]) {
    difference() {
        cylinder(r = 4.8, h = 6, center = true);
        translate([0,0,1]) {
            cylinder(r =3.75, h = 6, center = true);
        }
    }
}
}

module thinner(){
rotate([0,0,7])
rotate_extrude(angle=77,convexity = 10){
    translate([-10, -14, 0]){
        square([0.6,24]);
    }
}
}

module wings()
rotate([0,0,37]){

//wings
translate([0, 0, 12]){
rotate([0,0,-10])
rotate_extrude(angle=80,convexity = 10){
    translate([9, 0, 0]){
        square([3,1.5]);
    }
}
rotate([0,0,-70])
rotate_extrude(angle=80,convexity = 10){
    translate([-12, 0, 0]){
        square([3,1.5]);
    }
}
rotate([0,0,60])
rotate_extrude(angle=55,convexity = 10){
    translate([-12, 0, 0]){
        square([3,1.5]);
    }
}

//wingstoppers
color("red") translate([0,0,-1]) rotate([0,0,-20])
rotate_extrude(angle=12,convexity = 10){
    translate([-12, 0, 0]){
        square([3,1.1]);
    }
}

color("red") translate([0,0,-1]) rotate([0,0,-135])
rotate_extrude(angle=25,convexity = 10){
    translate([-12, 0, 0]){
        square([3,1.1]);
    }
}
}
}

module hole()
rotate_extrude(angle=0.9,convexity = 10){
    translate([-10, 0, 0]){
        square([2,0.3]);
    }
}
module longHole()
rotate_extrude(angle=75,convexity = 15){
    translate([-11, 0, 0]){
        square([4,0.3]);
    }
}
