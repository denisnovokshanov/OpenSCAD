//****************************************************************************//
// Section 1 - pramble                                                        //
//****************************************************************************//
// This OpenSCAD script create the plate with rounded edges and holes.
//
// Written by Denis Novokshanov on 23th September 2023
// Contact via LinkedIn
//****************************************************************************//


//****************************************************************************//
// Section 2 - modeling perameters and model parameters                       //
//****************************************************************************//
$fn=100;

plate_length = 100;
plate_width = 100;
plate_thickness = 5;

radius = 4;

plate_length_mod = plate_length - 2*radius;
plate_width_mod = plate_width - 2*radius;

base = 40;


//****************************************************************************//
// Section 3 - plate creation - module plate()                                //
//****************************************************************************//
module plate()
{
   translate([radius,radius,0])
    {
       minkowski(){
                   cube([plate_width_mod,plate_length_mod,plate_thickness]);
                   cylinder(r=radius,h=1);
                  }
    }
}

//****************************************************************************//
// Section 4 - final step (make holes in the plate)                           //
//****************************************************************************//
difference()
{
    plate();
//
    translate([10,10,-20]) rotate([0,0,0]) cylinder(r=radius,h=100);
    translate([90,90,-20]) rotate([0,0,0]) cylinder(r=radius,h=100);
    translate([10,90,-20]) rotate([0,0,0]) cylinder(r=radius,h=100);
    translate([90,10,-20]) rotate([0,0,0]) cylinder(r=radius,h=100);
//    
    translate([20     ,30     ,-20]) rotate([0,0,0]) cylinder(r=radius/2,h=100);
    translate([20+base,30     ,-20]) rotate([0,0,0]) cylinder(r=radius/2,h=100);
    translate([20     ,30+base,-20]) rotate([0,0,0]) cylinder(r=radius/2,h=100);
    translate([20+base,30+base,-20]) rotate([0,0,0]) cylinder(r=radius/2,h=100);
}

//****************************************************************************//
//                              *** The End ***                               //
//****************************************************************************//