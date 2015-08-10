shaftOD = 6.1;
m4OD = 4;

bearingStepHeightInner = 2;

module bearingCap() {
	rotate([180, 0, 0])
		translate([0, 0, -(bearingStepHeight * 2)])
			bearingInnerStep(bearing6807_2RS_d - iFitAdjust, bearingStepHeightInner, bearingStepWidth);
}

//bearingInnerStep(bearing6807_2RS_d - iFitAdjust, 2, 2);
module bearingInnerStep(bearingID, stepHeight, stepWidth) {
    difference() {
        union() {
            // this fits inside of the bearing
            cylinder(h = stepHeight * 2, d = bearingID);
            // this rests on the bearing inner lip
            cylinder(h = stepHeight, d = bearingID + stepWidth);
        }
/*
        // remove center
		translate([0, 0, -epsilon / 2.])
        	cylinder(h = (stepHeight * 2) + epsilon, d = bearingID - (stepWidth * 2));
*/
		translate([0, 0, -epsilon / 2.])
        	cylinder(h = (stepHeight * 2) + epsilon, d = shaftOD + epsilon);
		radial_array(n = 3) {
			translate([bearing6807_2RS_d / 3, 0, 0])
			cylinder(h = (stepHeight * 2) + epsilon, d = m4OD + epsilon / 2);
		}
    }
}

