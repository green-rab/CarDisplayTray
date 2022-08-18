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
_fn_u1 =  8;
_fn_u2 =  4;
_fn_d1 =  4;
_fn_d2 =  4;

_tmp_d1_deltaAngle =  60.0; //°
_tmp_d1_deltaSteps =   6.0; //mm


// for RENDERING
/*
_fn_u1 = 16;
_fn_u2 = 12;
_fn_d1 =  6;
_fn_d2 =  4;

_tmp_d1_deltaAngle =  10.0; //°
_tmp_d1_deltaSteps =   0.2; //mm
*/


// u1: tbd


// call module
carDisplayTray();


module carDisplayTray() {
    difference() {
    }
}


/*
    end of carDisplayTray.scad
*/
