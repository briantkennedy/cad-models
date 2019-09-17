


inner_full = 12.85;
inner_notch = 5.23;
inner_extra= 3;
// inner_l1 = inner_full - inner_notch;
// inner_l2 = inner_full - inner_l1;
inner_diameter = 11;
inner_radius=inner_diameter/2;
inner_short = 9.95;
    /*
https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Other_Language_Features#$fa,_$fs_and_$fn
    */

$fa=1;
$fs= 1;

// nub
difference() {
    cylinder(inner_full + inner_extra, d=inner_diameter);
    translate([-inner_diameter + inner_short, 0, inner_extra]) LockSlice();
}

// vertical rod
bag_clearance=34;
snap_clearance=6.3;
rod_len= bag_clearance +  snap_clearance + 30;
rod_shift= -inner_radius;

translate([rod_shift, rod_shift, -inner_diameter])
cube([rod_len, inner_diameter, inner_diameter]);

hook_radius=15;
ring_inner=hook_radius*2;
//translate([0, inner_diameter/2, ring_inner/2])
//rotate([90, 0, 0])
//ring(inner_diameter, ring_inner, ring_inner+inner_diameter*2);

// hook
translate([rod_len-inner_radius, inner_radius, ring_inner/2])
rotate([90, 0, 0])
halfring(inner_diameter, ring_inner, ring_inner+inner_diameter*2, 1);

// hook tip
tip_len = 10;
translate([rod_len+rod_shift-tip_len, rod_shift, hook_radius*2])
cube([tip_len, inner_diameter, inner_diameter]);

// tube hanger
tube_clearance = 14;
translate([bag_clearance+snap_clearance+inner_diameter, rod_shift, -tube_clearance-inner_diameter*2])
cube([30, inner_diameter, inner_diameter]);
translate([bag_clearance+snap_clearance,rod_shift,-inner_diameter-(tube_clearance+inner_diameter)])
cube([inner_diameter, inner_diameter, tube_clearance+inner_diameter]);


module halfring(height, inner, outer, dir=0) {
    difference() {
        angle = dir * 90;
        ring(height, inner, outer);
        rotate([0, 0, angle])
        translate([-outer/2-1, 0, -1])
        cube([outer+2, outer+2, height+2]);
    }
}

module ring(height, inner, outer) {
    difference() {
        cylinder(height, d=outer);
        translate([0, 0, -1])
        cylinder(height+2, d=inner);
    }
}

module LockSlice() {
    difference() {
        cube_side = 20;
        cube_mv = -cube_side / 2;
        translate([cube_mv, cube_mv, 0])
            cube([cube_side, cube_side, inner_notch]);
        //cylinder(inner_notch, inner_diameter);
        translate([0,0,-1])
        cylinder(inner_notch+2, d=inner_diameter);
    }
}
