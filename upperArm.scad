upperArmHeightExtension = 10;
upperArmLength = 150;
mainRingDiameter = bearing6807_2RS_d - iFitAdjust + bearingStepWidth;

module upperArm() {
	difference() {
		union () {
			translate([0, 0, -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2)])
				bearingInnerStep(bearing6807_2RS_d - iFitAdjust, bearingStepHeightInner, bearingStepWidth);
			translate([0, 0, -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2 + upperArmHeightExtension)])
				cylinder(h = upperArmHeightExtension, d = mainRingDiameter); //foo
			translate([0, 0,  -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2 + upperArmHeightExtension + upperArmHeightExtension / 2)])
				difference () {
					hull() {
						cylinder(h = upperArmHeightExtension / 2, d = mainRingDiameter);
						translate([upperArmLength, 0, 0])
							cylinder(h = upperArmHeightExtension / 2, d = bearing6807_2RS_d / 2);
					}
					translate([upperArmLength, 0, -epsilon / 2])
						cylinder(h = (upperArmHeightExtension / 2) + epsilon, d = bearing6807_2RS_d / 4);
				}
		}
		radial_array(n = 3) {
			translate([0, 0, -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2 + upperArmHeightExtension)])
				translate([bearing6807_2RS_d / 3, 0, -epsilon / 2.])
					cylinder(h = upperArmHeightExtension + epsilon, d = m4OD + epsilon / 2);
		}
		// set screw
		translate([0, 0, -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2 + upperArmHeightExtension  / 3)])

			rotate([0, 90, 180])
				cylinder(h = 30, d = 3); 
		// shaft
		translate([0, 0, -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2 + upperArmHeightExtension)])
			translate([0, 0, -epsilon * 6.]) {
				#difference() {
					cylinder(h = upperArmHeightExtension + 20 *epsilon, d = shaftOD);
					translate([-12, -5, 0])
						cube([10, 10, upperArmHeightExtension + 20]);
				}
			}
	}
}
