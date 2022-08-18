/*
 *  Car Display Tray
 * 
 *  File:     carDisplayTray.scad
 *
 *  Software: OpenSCAD
 *  Version:  2015.03
 *
 *  https://gitlab.com/green-rab
 *  Markus Gutermann, Germany, created: 17.08.2022
 */


// for DEBUG
_fn_hole =  20;


// for RENDERING
/*
_fn_u1 = 16;
_fn_u2 = 12;
_fn_d1 =  6;
_fn_d2 =  4;
*/


// fr - frame
fr_x          = 133.0; //mm
fr_y1         =  66.5 + 14.0; //mm
fr_y2         =  86.5 + 14.0; //mm
fr_z          =  40.0; //mm

fr_display_x  = 122.5; //mm
fr_display_y  =  78.0; //mm
fr_display_dy =   0.5; //mm
fr_display_dz =   8.0; //mm

fr_rail_x1    =  20.0; //mm ???
fr_rail_x2    =  80.0; //mm ???
fr_rail_z     =   5.0; //mm ???

fr_slot_x1    =  20.0; //mm ???
fr_slot_y     =  20.0; //mm ???
//...

// bd - board
bd_x1         = -42.5; //mm
bd_x2         = fr_x + 8.5; // mm
bd_y1         = -17.5; //mm
bd_y2         = -20.5; // mm
bd_y3         = -15.0; // mm
bd_z1         =   0.0 - 2.0; //mm
bd_z2         =  33.0 - 2.0; // mm
bd_z3         =  45.5 - 2.0; // mm


// call module
carDisplayTray();


module carDisplayTray() {
    union() {
        // frame
        difference() {
            linear_extrude(height = fr_z, convexity = 10) {
                polygon([[0, 0], [0, fr_y1], [fr_x, fr_y2], [fr_x, 0]]);
            }

            // display
            translate(v = [fr_x/2-fr_display_x/2, fr_display_dy, fr_display_dz]) {
                cube(size = [fr_display_x, fr_display_y, fr_z], center = false);
            }

            // rail
            translate(v = [fr_rail_x1, -0.1, -0.1]) {
                cube(size = [fr_rail_x2-fr_rail_x1, fr_y2+0.2, fr_rail_z+0.1], center = false);
            }

            // slot
        }

        // board
        translate(v = [bd_x2, 0, 0]) {
            rotate(a = -90, v = [0, 1, 0]) {
                linear_extrude(height = (-bd_x1)+bd_x2, convexity = 10) {
                    polygon([[bd_z1, 0], [bd_z1, bd_y1], [bd_z2, bd_y2], [bd_z3, bd_y3], [bd_z3, 0]], convexity = 10);
                }
            }
        }
    }
}


/*
    end of carDisplayTray.scad
*/
