// dimensions from http://www.fairburyfastener.com/xdims_metric_nuts.htm
M8Nut_F = 13 + iFitAdjust;
M8Nut_W = 7 + iFitAdjust;
M8Nut_H = 6.5;
M8Nut_ID = 8;

module M8Nut(includeShaft) {
	translate([0, 0, M8Nut_H / 2])
	difference() {
		union() {
			cube(size=[M8Nut_F, M8Nut_W, M8Nut_H], center=true);
			rotate([0, 0, 60])
				cube(size=[M8Nut_F, M8Nut_W, M8Nut_H], center=true);
			rotate([0, 0, 120])
				cube(size=[M8Nut_F, M8Nut_W, M8Nut_H], center=true);
		}
		if (includeShaft) {
			translate([0, 0, -epsilon / 2])
				cylinder(h = M8Nut_H + 2 * epsilon, d = M8Nut_ID, center = true);
		}
	}
}
