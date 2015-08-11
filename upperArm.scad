upperArmHeightExtension = 10;

module upperArm() {
	difference() {
		union () {
			translate([0, 0, -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2)])
				bearingInnerStep(bearing6807_2RS_d - iFitAdjust, bearingStepHeightInner, bearingStepWidth);
			translate([0, 0, -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2 + upperArmHeightExtension)])
				cylinder(h = upperArmHeightExtension, d = bearing6807_2RS_d);
		}
		radial_array(n = 3) {
			translate([0, 0, -(bearingStepHeight + bearingStepHeightInner + bearing6807_2RS_B + motorPlateHeight / 2 + upperArmHeightExtension)])
				translate([bearing6807_2RS_d / 3, 0, -epsilon / 2.])
					cylinder(h = upperArmHeightExtension + epsilon, d = m4OD + epsilon / 2);
		}
	}
}
