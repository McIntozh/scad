/*
Generator for miniature bases and base toppers with patterns of european plaster stones/pavements.

Author: Dennis Schwarz (blacknpebble@gmail.com)
License: Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) https://creativecommons.org/licenses/by-nc-sa/4.0/
For commercial use please contact the author
*/

/* [Global] */
//Miniature scale, ("32 mm scale" would be 1/57.2, so enter 57.2 here), see https://en.wikipedia.org/wiki/Miniature_model_(gaming) for more examples
scale_factor=57.2; //[30:200]


/* [Topper] */
//Diameter of the top surface
base_top_diameter=23; //[13:50]

//Pattern to be applied to the surface
pattern="shifted"; //[none, straigt, shifted, elbow, windmill, bone]

/* [Base] */
//Type of the base you want to add
base_type="none"; //[none, flat, with_hole]

//Bottom diameter of the base (usually ~2mm larger than the top)
base_bottom_diameter=25; //[15:52]


/* [Hidden] */
$fn= $preview?32:64;
stone_size=[200,100,60];
bone_stone_size=[200,165,60];
scale=1/scale_factor;

modifier=1 / 23*base_top_diameter / 57.2*scale_factor;

translate([0,0,1])
intersection(){
cylinder(h=4,d=base_top_diameter,center=true);
scale(scale)
difference(){
    cube([2000*modifier,2000*modifier,60],center=true);
    
    if(pattern=="bone")
        pattern_bone(13*modifier,19*modifier);
    
    if(pattern=="windmill")
        pattern_windmil(8*modifier,9*modifier);
    
    if(pattern=="elbow")
        pattern_elbow(20*modifier,20*modifier);   
       
    if(pattern=="shifted")
        pattern_shifted(10*modifier,13*modifier);
    if(pattern=="straigt")
        pattern_straight(10*modifier,13*modifier);
}
}

if( base_type=="flat" ){
    cylinder(h=3-.5,d1=base_bottom_diameter,d2=base_top_diameter,center=true);
}
if(base_type=="with_hole" ){
    difference(){
    cylinder(h=3,d1=base_bottom_diameter,d2=base_top_diameter,center=true);
    cylinder(h=3.5,d=base_top_diameter,center=true);
    }
    translate([0,0,.5])
    cylinder(h=1,d=base_top_diameter,center=true);
}


module pattern_bone($count_x,$count_y){
translate([$count_x/2*-bone_stone_size[0]/2,$count_y/2*-(bone_stone_size[1]/2-17.5),0])
for ( x = [0:1:$count_x/2]) {
for ( y = [0:1:$count_y/2]) {
translate([bone_stone_size[0]*x+(bone_stone_size[0]/2*(y%2)),(bone_stone_size[1]-17.5)*y,0])
bone_stone();
}
}
}
module bone_stone(){
translate([0,0,bone_stone_size[2]/2]){
translate([-bone_stone_size[0]/2,0,0])rotate([0,45,0])cube([10,bone_stone_size[1]+10,10],center=true);
translate([66,-69,0])rotate([0,45,39])cube([10,bone_stone_size[0]/20*4,10],center=true);

translate([-66,-69,0])rotate([0,45,-39])cube([10,bone_stone_size[0]/20*4,10],center=true);

translate([-87.5,-bone_stone_size[1]/2,0])rotate([45,0,0])cube([bone_stone_size[0]/20*2.5,10,10],center=true);

translate([0,-bone_stone_size[1]/3,0])rotate([45,0,0])cube([bone_stone_size[0]/2+14.5,10,10],center=true);

translate([87.5,-bone_stone_size[1]/2,0])rotate([45,0,0])cube([bone_stone_size[0]/20*2.5,10,10],center=true);
}
}


/*
 |___| |___| |___| |___| |___| |___| |___|
_|_| |_|_| |_|_| |_|_| |_|_| |_|_| |_|_| |
___|_|___|_|___|_|___|_|___|_|___|_|___|_|
 |___| |___| |___| |___| |___| |___| |___|
_|_| |_|_| |_|_| |_|_| |_|_| |_|_| |_|_| |
___|_|___|_|___|_|___|_|___|_|___|_|___|_|
 |___| |___| |___| |___| |___| |___| |___|
_|_| |_|_| |_|_| |_|_| |_|_| |_|_| |_|_| |
___|_|___|_|___|_|___|_|___|_|___|_|___|_|
*/
module pattern_windmil($count_x,$count_y){
translate([-$count_x*stone_size[1]+stone_size[1],-$count_y*stone_size[1]+stone_size[1],0])
for ( x = [0:1:$count_x/2]) {
for ( y = [0:1:$count_y/2]) 
translate([x*(stone_size[0]+stone_size[1]),y*(stone_size[0]+stone_size[1]),0]){
translate([stone_size[0],stone_size[1],0]) rotate([0,0,-180]) corner_gap();
translate([stone_size[0],stone_size[1]*2,0]) rotate([0,0,-90])corner_gap();
translate([stone_size[1],stone_size[0],0]) corner_gap();
translate([stone_size[1],stone_size[1],0]) rotate([0,0,90])corner_gap();
translate([0,stone_size[1],0]) corner_gap();
translate([stone_size[0]+stone_size[1],stone_size[0],0]) rotate([0,0,180]) corner_gap();
translate([-stone_size[1],0,0]) y_gap();
translate([0,stone_size[0],0])  y_gap();
}}
}

/*
_|___| |_|___| |_|___| |_|___| |_|___| |_|___| |_|
___| |_|___| |_|___| |_|___| |_|___| |_|___| |_|
_| |_|___| |_|___| |_|___| |_|___| |_|___| |_|___|
 |_|___| |_|___| |_|___| |_|___| |_|___| |_|___| |
_|___| |_|___| |_|___| |_|___| |_|___| |_|___| |
___| |_|___| |_|___| |_|___| |_|___| |_|___| |_|
_| |_|___| |_|___| |_|___| |_|___| |_|___| |_|___|
 |_|___| |_|___| |_|___| |_|___| |_|___| |_|___| |
_|___| |_|___| |_|___| |_|___| |_|___| |_|___| |
*/
module pattern_elbow($count_x,$count_y){
translate([-stone_size[0]*($count_x/4+1),-stone_size[1]*($count_y/2+1),0])
for ( x = [0:1:$count_x]) {
for ( y = [0:1:$count_y]) {
  xshift=(stone_size[0]+stone_size[1]*2);
  if(x%3==0){
    translate([x/3*xshift+(y%4)*stone_size[1],y*stone_size[1],0]){
     x_gap();
     translate([-stone_size[0],stone_size[1],0])
     y_gap();
     translate([0,-stone_size[1],0])rotate([0,0,90])
     y_gap();
    }
  }else if(x%3==1 && y%2==0){
  translate([((x-1)/3)*xshift+(y%4)*stone_size[1],y*stone_size[1],0])
    translate([stone_size[0]+stone_size[1],0,0])rotate([0,0,90])
    x_gap();
    
    
  }else if(x%3==2 && y%2==0){
  translate([((x-2)/3)*xshift+(y%4)*stone_size[1],y*stone_size[1]+stone_size[1],0])
    translate([stone_size[0]+stone_size[1]*2,0,0])rotate([0,0,90])
    x_gap();
  }   
}}
}

module pattern_shifted($count_x,$count_y){
    translate([-stone_size[0]*($count_x/2-1),-stone_size[1]*$count_y/2,0])  
    for ( x = [0:1:$count_x]) {
        for ( y = [0:1:$count_y]) {
            shift=stone_size[0]/2*(y%2);
            translate([stone_size[0]*x-shift,stone_size[1]*y,0])
            y_gap();
            translate([stone_size[0]*x,stone_size[1]*y,0])
            x_gap();
           } 
    }
}

module pattern_straight($count_x,$count_y){
translate([-stone_size[0]*($count_x/2-1),-stone_size[1]*$count_y/2,0])
    for ( x = [0:1:$count_x]) {
        for ( y = [0:1:$count_y]) {
            translate([stone_size[0]*x,stone_size[1]*y,0])
            corner_gap();
            if(x==$count_x)
              translate([stone_size[0]*($count_x+1),stone_size[1]*y,0])
              y_gap();
        }
    }
    
}

module corner_gap(){
    x_gap();
    y_gap();
}

module x_gap(){
    translate([stone_size[0]/2,stone_size[1],stone_size[2]/2])
    rotate([45,0,0])
    cube([stone_size[0],10,10],center=true);
}

module y_gap(){
    translate([stone_size[0],stone_size[1]/2,stone_size[2]/2])
    rotate([0,45,0])
    cube([10,stone_size[1],10],center=true);
}