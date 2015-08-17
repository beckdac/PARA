// dimensions from http://www.fairburyfastener.com/xdims_metric_nuts.htm
M8Nut_F = 13;
M8Nut_H = 6.5;
M8Nut_ID = 8;

module M8Nut(includeShaft) {
	translate([0, 0, M8Nut_H / 2])
	difference() {
		intersection() {
			cube(size=[M8Nut_F, M8Nut_F, M8Nut_H], center=true);
			rotate([0, 0, 45])
				cube(size=[M8Nut_F, M8Nut_F, M8Nut_H], center=true);
			rotate([0, 0, 90])
				cube(size=[M8Nut_F, M8Nut_F, M8Nut_H], center=true);
		}
		if (includeShaft) {
			translate([0, 0, -epsilon / 2])
				cylinder(h = M8Nut_H + 2 * epsilon, d = M8Nut_ID, center = true);
		}
	}
}
