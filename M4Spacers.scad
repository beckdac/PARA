spacerHoleDiameter = 4.75;
spacerWallThickness = 2;
epsilon = 1;

$fn = 64;

for (i = [1 : 5]) {
	j = i - 1;
	translate([0, j * 10, 0])
		difference() {
			cylinder(h = i, d = spacerHoleDiameter + 2 * spacerWallThickness);
			translate([0, 0, -epsilon / 2])
				cylinder(h = i + epsilon, d = spacerHoleDiameter);
		}
}
