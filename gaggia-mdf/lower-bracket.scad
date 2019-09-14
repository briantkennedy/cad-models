

height = 2;
width = 4;

l1 = 71.5;
l2 = 38.62;
l3=24.5;

// python
// math.acos(28/38.62) / math.pi * 180
theta= 43.5;

cube([l1, width, height]);
translate([l1, 0, 0])
    rotate([0, 0, theta])
    cube([l2, width, height]);


l2modx = cos(theta) * l2 - width * sin(theta);
l2mody = sin(theta) * l2  - width * (1-cos(theta));
translate([l1+l2modx, l2mody, 0])
    cube([l3, width, height]);