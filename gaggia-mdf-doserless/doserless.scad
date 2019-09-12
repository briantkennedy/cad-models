//

wallSize = 2;
spoutWidth = 40.5;
spoutHeight = 25.8;
spoutWidthOuter = spoutWidth+wallSize*2;
spoutHeightOuter = spoutHeight+wallSize*2;

module Conduit(length=100, angle=45) {
    alpha = 90 - (angle / 2);
    b = spoutHeightOuter / tan(alpha);
    d = sin(alpha) * b;
    difference() {
        cube([spoutWidthOuter, length+b, spoutHeightOuter]);
        translate([wallSize, -1, wallSize])
        cube([spoutWidth, length+b+2, spoutHeight]);
        translate([-1, length, 0])
        rotate([-angle/2, 0, 0])
        cube([spoutWidthOuter+2, d+1, spoutHeightOuter/sin(alpha)+1]);
    }
}


attachLen = 4;
spoutLen = 30;
angle = 50;

Conduit(attachLen, angle);
drop = sin(angle) * spoutLen;
shift = cos(angle) * spoutLen + attachLen;
mirror([0, 1, 0])
translate([0, -shift, -drop])
rotate([angle, 0, 0])
Conduit(spoutLen, angle);