
doser_width = 101;
doser_height = 65;
spinner_diameter = 55;
spinner_radius =  spinner_diameter / 2;
grind_window_width = 37;
grind_window_height = 30;
out_width = 24.5;

difference() {
    /*
https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Other_Language_Features#$fa,_$fs_and_$fn
    */
  $fa=1;
  cylinder(d=doser_width, h=doser_height-3);
  translate([spinner_radius, -out_width/2, 0])
    cube([out_width, out_width, doser_height]);

    /* was cube for full grinder output
  translate([-80, -grind_window_width/2, doser_height-grind_window_height])
    cube([grind_window_width, grind_window_width, grind_window_height]);
  */

  translate([spinner_radius, -out_width/2, 0])
    rotate([0, -66, 0])
    cube([100, out_width, 100]);
}
