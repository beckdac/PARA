bearing608ZZ_rs = 2;	// lip width
bearing608ZZ_d = 8;		// ID
bearing608ZZ_D = 22;		// OD
bearing608ZZ_B = 7;		// width

module bearing608ZZ() {
    rs = bearing608ZZ_rs;
    d = bearing608ZZ_d;
    D = bearing608ZZ_D;
    B = bearing608ZZ_B;
	//render(convexity = 3)
    translate([0, 0, B / 2])
	union() {
        // outer lip
        difference() {
            cylinder(h = B, d = D, center = true);
			translate([0, 0, -epsilon / 2])
            	cylinder(h = B + epsilon * 2, d = D - rs, center = true);
        }
        // inner lip
        difference() {
            cylinder(h = B, d = d + rs, center = true);
			translate([0, 0, -epsilon / 2])
            	cylinder(h = B + epsilon * 2, d = d, center = true);
        }
        // race
            difference() {
                cylinder(h = B - (rs * 2), d = D, center = true);
				translate([0, 0, -epsilon / 2])
                	cylinder(h = (B - (rs * 2)) + epsilon * 2, d = d, center = true);
            };
    }
}
