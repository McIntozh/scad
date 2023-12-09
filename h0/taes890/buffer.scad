rotate([-90,0,0])
buffer();

module buffer_holes(){
for(j=[0:1])mirror([0,j,0])for(i=[-1:2:1])
translate([1750/2*-i,(13000/2+200),-30])
scale([1.01,1,1.01])buffer_hole();
}

module buffer_hole(){
color("lightblue")translate([0,-249,0]) cube([100,100,100],center=true);
}
module buffers(){
for(j=[0:1])mirror([0,j,0])for(i=[-1:2:1]){
translate([1750/2*-i,(13000/2+200),-30]){
    buffer();
}
}
}

module buffer(){
buffer_hole();
color("lime")rotate([90,0,0])cylinder(h=400,r=90,center=true);
color("blue")translate([0,125,0])rotate([90,0,0])cylinder(h=250,r=100,center=true);
color("red")translate([0,190,0])rotate([90,0,0])cylinder(h=50,r=120,center=true);
color("red")translate([0,230,0])rotate([90,0,0])cylinder(h=50,r=150,center=true);

}