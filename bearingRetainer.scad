retainerTabHeight = 2 * bearingStepHeight;
retainerCupDiameter = 10;

module bearingRetainer() {
	union () {
		translate([0, 0, - ((2 * bearingStepHeight) + (bearing6807_2RS_B / 3.))])
			rotate(a=[180, 0, 0])
				bearingOuterStep(bearing6807_2RS_D + iFitAdjust, bearingStepHeight, bearingStepWidth);
		translate([0, 0, - ((2 * bearingStepHeight) + (bearing6807_2RS_B / 3.))])
			rotate(a=[180, 0, 0])
				difference() {
					cylinder(h = bearingStepHeight * 2, d = bearing6807_2RS_D + retainerCupDiameter);
					translate([0, 0, -epsilon / 2])
						cylinder(h = bearingStepHeight * 2 + epsilon, d = bearing6807_2RS_D + epsilon);
				}
		difference() {
			radial_array() {
				translate([-nema23MountHoleDistance / 2, -nema23MountHoleDistance / 2, - ((2 * bearingStepHeight) + (bearing6807_2RS_B / 3) + (bearingStepHeight * 2))])
					difference() {
						union() {
							cylinder(h = retainerTabHeight + ((bearing6807_2RS_B / 3) + (bearingStepHeight * 2)), d = nema23MountHoleDiameter * 2);
							rotate(a=[0, 0, 45])
							translate([0, -nema23MountHoleDiameter, 0])
								cube([nema23MountHoleDistance, nema23MountHoleDiameter * 2, retainerTabHeight]);
						}
						translate([0, 0, -epsilon / 2])
							cylinder(h = retainerTabHeight + ((bearing6807_2RS_B / 3) + (bearingStepHeight * 2)) + epsilon, d = nema23MountHoleDiameter);
					}
			}
			translate([0, 0, - ((2 * bearingStepHeight) + (bearing6807_2RS_B / 3.))])
				rotate(a=[180, 0, 0])
					translate([0, 0, -epsilon / 2])
						cylinder(h = bearingStepHeight * 2 + epsilon, d = bearing6807_2RS_D + epsilon);
		}
	}
}

module radial_array(vec = [0,0,1], n = 4) {
    for ( i = [0 : n - 1] )
    {
        rotate( i * 360 / n, vec)
            children();
    }   
}
