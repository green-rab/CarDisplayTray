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
fr_width    = 100.0; //mm
fr_height   =  20.0; //mm
fr_depth    =  50.0; //mm

fr_border_w =   4.0; //mm

fr_bottom_w =  60.0; //mm

fr_hole_x   =  40.0; //mm
fr_hole_y   =   0.0; //mm
fr_hole_dia =   4.0; //mm


// call module
carDisplayTray();


module carDisplayTray() {
    union() {
        // frame
        translate(v = [-fr_width/2, 0, 0]) {
            difference() {
                cube(size = [fr_width, fr_height, fr_depth], center = false);

                // border
                translate(v = [fr_border_w, fr_border_w, fr_border_w]) {
                    cube(size = [fr_width - 2*fr_border_w, fr_height, fr_depth], center = false);
                }

                // bottom
                translate(v = [fr_width/2-fr_bottom_w/2, -0.1, fr_border_w]) {
                    cube(size = [fr_bottom_w, fr_border_w+0.2, fr_depth], center = false);
                }

                // holes
                translate(v = [fr_width/2-fr_hole_x, fr_height/2-fr_hole_y, -0.1]) {
                    cylinder(h = fr_border_w+0.2, d = fr_hole_dia, center = false, $fn = _fn_hole);
                }
                translate(v = [fr_width/2+fr_hole_x, fr_height/2-fr_hole_y, -0.1]) {
                    cylinder(h = fr_border_w+0.2, d = fr_hole_dia, center = false, $fn = _fn_hole);
                }
            }
        }
    }
}


/*
    end of carDisplayTray.scad
*/
