// interference fit adjustment for 3D printer
iFitAdjust = .4;
iFitAdjust_d = .25;
epsilon = 1;

$fn = 64;

use <MCAD/stepper.scad>
include <bearing6807_2RS.scad>
include <motorPlate.scad>
include <bearingRetainer.scad>
include <bearingCap.scad>
include <upperArm.scad>

*translate([0, 0, motorPlateHeight])
    motor();
*motorPlate();
*translate([0, 0, -bearingStepHeight - (bearingStepHeight * 2.0)])
    bearing6807_2RS();
bearingRetainer();

#bearingCap();

upperArm();
