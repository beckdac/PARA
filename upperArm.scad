upperArmHeightExtension = 10;
upperArmLength = 150;
mainRingDiameter = bearing6807_2RS_d - iFitAdjust_d + bearingStepWidth;
M8NutDiameterExtension = 8;

module upperArm() {
	difference() {
		union () {
			translate([0, 0, -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2)])
				bearingInnerStep(bearing6807_2RS_d - iFitAdjust, bearingStepHeightInner, bearingStepWidth);
			translate([0, 0, -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2 + upperArmHeightExtension)])
				cylinder(h = upperArmHeightExtension, d = mainRingDiameter);
			translate([0, 0,  -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2 + upperArmHeightExtension + upperArmHeightExtension / 2)])
				difference () {
					hull() {
						cylinder(h = M8Nut_H, d = mainRingDiameter);
						translate([upperArmLength, 0, 0])
							cylinder(h = M8Nut_H, d = M8Nut_F + M8NutDiameterExtension);
					}
					// there are two here so that the rapid drawing looks correct, not for a functional reason
					translate([upperArmLength, 0, -epsilon])
						M8Nut(includeShaft = 0);
					translate([upperArmLength, 0, epsilon])
						M8Nut(includeShaft = 0);
				}
		}
		radial_array(n = 3) {
			translate([0, 0, -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2 + upperArmHeightExtension)])
				translate([bearing6807_2RS_d / 3, 0, -epsilon / 2.])
					cylinder(h = upperArmHeightExtension + epsilon, d = M4ScrewDiameter);
		}
		// set screw
		translate([0, 0, -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2 + upperArmHeightExtension  / 1)])

			rotate([0, 90, 180])
				cylinder(h = 30, d = 3); 
		// shaft
		translate([0, 0, -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2 + upperArmHeightExtension)])
			translate([0, 0, -epsilon * 6.]) {
				difference() {
					cylinder(h = upperArmHeightExtension + 20 *epsilon, d = shaftOD + epsilon);
					translate([-12.5, -5, 0])
						cube([10, 10, upperArmHeightExtension + 20]);
				}
			}
	}
}
