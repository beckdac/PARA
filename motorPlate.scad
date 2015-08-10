motorPlateHeight = 5;
motorPlateWidth = 60;
motorPlateLength = 100;
bearingStepWidth = 2;
bearingStepHeight = 5;
nema23MountHoleDistance = 47.14;
nema23MountHoleDiameter = 4.75;
nema23RoundExtrusionDiameter = bearing6807_2RS_D - bearingStepWidth;
epsilon = 1;

module motorPlate() {
	union() {
		translate([0, 0, motorPlateHeight / 2.0]) {
			difference() {
				cube(size = [motorPlateWidth, motorPlateLength, motorPlateHeight], center = true);
				cylinder(h = 5 + epsilon, d = nema23RoundExtrusionDiameter, center = true);
				translate([nema23MountHoleDistance / 2.0, nema23MountHoleDistance / 2.0, 0]) {
					cylinder(h = 5 + epsilon, d = nema23MountHoleDiameter, center = true);
				}
				translate([nema23MountHoleDistance / 2.0, -nema23MountHoleDistance / 2.0, 0]) {
					cylinder(h = 5 + epsilon, d = nema23MountHoleDiameter, center = true);
				}
				translate([-nema23MountHoleDistance / 2.0, nema23MountHoleDistance / 2.0, 0]) {
					cylinder(h = 5 + epsilon, d = nema23MountHoleDiameter, center = true);
				}
				translate([-nema23MountHoleDistance / 2.0, -nema23MountHoleDistance / 2.0, 0]) {
					cylinder(h = 5 + epsilon, d = nema23MountHoleDiameter, center = true);
				}
			}
		}
		translate([0, 0, - 2 * bearingStepHeight])
			bearingOuterStep(bearing6807_2RS_D + iFitAdjust, bearingStepHeight, bearingStepWidth);
	}
}

module bearingOuterStep(bearingOD, stepHeight, stepWidth) {
    difference() {
        cylinder(h = (stepHeight * 2), d = bearingOD + stepWidth);
		translate([0, 0, -epsilon / 2.0]) {
        	cylinder(h = (stepHeight * 2) + epsilon, d = bearingOD - stepWidth);
        	cylinder(h = (stepHeight / 2) + epsilon, d = bearingOD);
		}
    }
}
