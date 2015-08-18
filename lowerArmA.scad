lowerArmLength = 50;
bearing608ZZDiameterExtension = 8;

module lowerArmA() {
	difference() {
		hull() {
			cylinder(h = bearing608ZZ_B, d = bearing608ZZ_D + bearing608ZZDiameterExtension);
			translate([0, lowerArmLength, 0])
				cylinder(h = bearing608ZZ_B, d = bearing6807_2RS_D + bearing608ZZDiameterExtension);
		}
		translate([0, 0, -epsilon / 2])
			cylinder(h = bearing608ZZ_B + epsilon, d = bearing608ZZ_D + iFitAdjust_d);
		translate([0, lowerArmLength, -epsilon / 2])
			cylinder(h = bearing608ZZ_B + epsilon, d = bearing6807_2RS_D + iFitAdjust_d);
	}
}
