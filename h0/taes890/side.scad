side();
module side(){
translate([0,0,1150]){
difference(){

    cube([100,13000,2300],center=true);

    doorhole();
    }
}
vertical_stipes();
top_stripe();



translate([25,0,-125]){
cube([50,13000,250],center=true);
side_part_connectors();
}
}

module doorhole(){
 cube([200,2700,2100],center=true);
}

module vertical_stipes(){
for(i=[-9:9])if(i!=0)
translate([70,600*i+((2700/2-400)*sign(i)),1050])
 color("red")cube([50,150,2500],center=true);
}

module top_stripe(){
color("red")translate([70,0,2250])
cube([50,13000,100],center=true);
}

module side_part_connectors(){
color("black"){
side_2_bottom_part_connector();
}
}
module side_2_bottom_part_connector(){
translate([-45,0,20])
cube([45,12000,50],center=true);
}