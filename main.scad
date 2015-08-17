// interference fit adjustment for 3D printer
iFitAdjust = .4;
iFitAdjust_d = .25;
epsilon = 1;
M4ScrewDiameter = 4; // no iFit on this for now

$fn = 64;

use <MCAD/stepper.scad>
include <bearing6807_2RS.scad>
include <bearing608ZZ.scad>
include <motorPlate.scad>
include <bearingRetainer.scad>
include <bearingCap.scad>
include <M8Nut.scad>
include <upperArm.scad>

motorSeparation = 100;
plateJoinWidth = motorSeparation - motorPlateWidth;

*translate([0, 0, 50])
    M8Nut(includeShaft = 1);

*translate([0, 0, motorPlateHeight])
    motor();
*difference() {
    union() {
        translate([motorPlateWidth / 2 + plateJoinWidth / 2, 0, motorPlateHeight / 2])
            cube(size=[plateJoinWidth, motorPlateLength, motorPlateHeight], center=true);
        motorPlate();
        translate([motorSeparation, 0, 0])
            motorPlate();
    }
    translate([-(motorPlateWidth / 2 - 5), -10, motorPlateHeight / 2])
        cylinder(h = 5 + epsilon, d = nema23MountHoleDiameter, center = true);
    translate([-(motorPlateWidth / 2 - 5), +10, motorPlateHeight / 2])
        cylinder(h = 5 + epsilon, d = nema23MountHoleDiameter, center = true);
    translate([(motorPlateWidth / 2 - 5) + plateJoinWidth + motorPlateWidth, -10, motorPlateHeight / 2])
        cylinder(h = 5 + epsilon, d = nema23MountHoleDiameter, center = true);
    translate([(motorPlateWidth / 2 - 5) + plateJoinWidth + motorPlateWidth, +10, motorPlateHeight / 2])
        cylinder(h = 5 + epsilon, d = nema23MountHoleDiameter, center = true);
}
*translate([0, 0, -bearingStepHeight - (bearingStepHeight * 2.0)])
    bearing6807_2RS();
*bearingRetainer();

*rotate([0, 0, 90])
    bearingCap();

rotate([0, 0, 90])
    upperArm();

translate([motorSeparation, 0, 0])
    rotate([0, 0, 90])
        upperArm();
