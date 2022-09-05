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


// resolution
_fn                = 100;

// fr - frame
fr_dim_x           = 133.0; //mm

fr_delta_y         =  14.0; //mm

fr_dim_y1          =  68.0 + fr_delta_y; //mm
fr_dim_y2          =  87.0 + fr_delta_y; //mm
fr_dim_z           =  40.0; //mm

fr_edge_r          =   5.0; //mm

fr_display_dim_x   = 122.5; //mm
fr_display_dim_y   =  78.0; //mm
fr_display_delta_z =   6.0; //mm

fr_rail_delta_x    =   1.5; //mm
fr_rail_pos_x1     =  31.5 - fr_rail_delta_x; //mm
fr_rail_pos_x2     = fr_rail_pos_x1 + 52.5 + (2 * fr_rail_delta_x); //mm
fr_rail_dim_z      =   6.1; //mm

fr_feet_dim_x      =  15.0; //mm
fr_feet_dim_z      =   3.0; //mm

// bd - board
bd_pos_x1          = -42.5; //mm
bd_pos_x2          =   8.5 + fr_dim_x; // mm

bd_pt1_pos_y       =   0.0; //mm
bd_pt1_pos_z       =  -2.0; //mm
bd_pt2_pos_y       = -17.5; //mm
bd_pt2_pos_z       =  -2.0; //mm
bd_pt3_pos_y       = -20.5; //mm
bd_pt3_pos_z       =  31.0; //mm
bd_pt4_pos_y       = -15.0; //mm
bd_pt4_pos_z       =  43.5; //mm
bd_pt5_pos_y       =   0.0; //mm
bd_pt5_pos_z       =  43.5; //mm

bd_edge_r          =   5.0; //mm

// st - slot
st_delta_x         =   3.0; //mm
st_delta_y         =   1.0; //mm

st_pos_x1          =  58.0 + st_delta_x; //mm
st_pos_x2          = st_pos_x1 + 20.0 - (2 * st_delta_x); //mm
st_pos_y1          =  32.0 + st_delta_y; //mm
st_pos_y2          = st_pos_y1 + 15.0 - (2 * st_delta_y); //mm

st_bar_dim_z       =   2.0; //mm

// hl - hole
hl_connector_d     =  26.0; //mm
h1_connector_dim_x = bd_pos_x1 + 6.0; //mm


// call module
carDisplayTray();


module carDisplayTray() {
    difference() {
        union() {
            // frame
            union() {
                difference() {
                    linear_extrude(height = fr_dim_z, convexity = 10) {
                        minkowski() {
                            tmp_dy = ((fr_dim_y2 - fr_dim_y1) / fr_dim_x) * fr_edge_r;

                            points = [
                                [fr_edge_r,            fr_edge_r+0.1],
                                [fr_edge_r,            fr_dim_y1 - fr_edge_r + tmp_dy],
                                [fr_dim_x - fr_edge_r, fr_dim_y2 - fr_edge_r - tmp_dy],
                                [fr_dim_x - fr_edge_r, fr_edge_r+0.1]
                            ];

                            polygon(points, convexity = 10);

                            circle(r = fr_edge_r, $fn = _fn);
                        }
                    }

                    // display
                    translate(v = [fr_dim_x/2 - fr_display_dim_x/2, 0, fr_display_delta_z]) {
                        cube(size = [fr_display_dim_x, fr_display_dim_y, fr_dim_z], center = false);
                    }

                    // rail
                    tmp_epsilon    = acos((bd_edge_r - abs(bd_pt1_pos_z)) / bd_edge_r);
                    tmp_rail_a     = sin(tmp_epsilon) * bd_edge_r;
                    tmp_rail_b     = bd_edge_r - tmp_rail_a;
                    tmp_rail_dim_y = fr_delta_y - tmp_rail_b;
                    translate(v = [fr_rail_pos_x1, tmp_rail_dim_y, -0.1]) {
                        cube(size = [fr_rail_pos_x2 - fr_rail_pos_x1, fr_dim_y2+0.2, fr_rail_dim_z+0.1], center = false);
                    }
                }

                // feet
                translate(v = [fr_dim_x/2 - fr_display_dim_x/2, 0, fr_display_delta_z]) {
                    cube(size = [fr_feet_dim_x, fr_display_dim_y, fr_feet_dim_z], center = false);
                }
                translate(v = [fr_dim_x/2 + fr_display_dim_x/2 - fr_feet_dim_x, 0, fr_display_delta_z]) {
                    cube(size = [fr_feet_dim_x, fr_display_dim_y, fr_feet_dim_z], center = false);
                }
            }

            // board
            difference() {
                translate(v = [bd_pos_x2, fr_delta_y, 0]) {
                    rotate(a = -90, v = [0, 1, 0]) {
                        linear_extrude(height = (-bd_pos_x1) + bd_pos_x2, convexity = 10) {
                            minkowski() {
                                tmp_alpha      = atan((abs(bd_pt3_pos_y) - abs(bd_pt2_pos_y)) / (bd_pt3_pos_z - bd_pt2_pos_z));
                                tmp_gamma      = atan((abs(bd_pt4_pos_y) - abs(bd_pt3_pos_y)) / (bd_pt3_pos_z - bd_pt4_pos_z));

                                tmp_pt2_a      = cos(tmp_alpha) * bd_edge_r;
                                tmp_pt2_b      = sin(tmp_alpha) * bd_edge_r;
                                tmp_pt2_c      = sin(tmp_alpha) * (bd_edge_r - tmp_pt2_b);
                                tmp_pt2_pos_dy = tmp_pt2_a - tmp_pt2_c;

                                tmp_pt4_a      = cos(tmp_gamma) * bd_edge_r;
                                tmp_pt4_b      = sin(tmp_gamma) * bd_edge_r;
                                tmp_pt4_c      = sin(tmp_gamma) * (bd_edge_r - tmp_pt4_b);
                                tmp_pt4_pos_dy = tmp_pt4_a - tmp_pt4_c;

                                tmp_beta       = 180 - tmp_alpha - tmp_gamma;
                                tmp_pt3_a      = bd_edge_r / sin(tmp_beta / 2);
                                tmp_delta      = tmp_gamma + (tmp_beta / 2) - 90;
                                tmp_pt3_pos_dy = cos(tmp_delta) * tmp_pt3_a;
                                tmp_pt3_pos_dz = sin(tmp_delta) * tmp_pt3_a;

                                points = [
                                    [bd_pt1_pos_z + bd_edge_r,        bd_pt1_pos_y - bd_edge_r],
                                    [bd_pt2_pos_z + bd_edge_r,        bd_pt2_pos_y + tmp_pt2_pos_dy],
                                    [bd_pt3_pos_z - tmp_pt3_pos_dz,   bd_pt3_pos_y + tmp_pt3_pos_dy],
                                    [bd_pt4_pos_z - bd_edge_r,        bd_pt4_pos_y + tmp_pt4_pos_dy],
                                    [bd_pt5_pos_z - bd_edge_r,        bd_pt5_pos_y - bd_edge_r]
                                ];

                                polygon(points, convexity = 10);

                                circle(r = bd_edge_r, $fn = _fn);
                            }
                        }
                    }
                }

                // cut off for frame
                cube(size = [fr_dim_x, fr_delta_y+0.1, fr_dim_z], center = false);
            }

            // slot
            union() {
                // slot for fixation
                translate(v = [st_pos_x1, st_pos_y1, 0]) {
                    cube(size = [st_pos_x2-st_pos_x1, st_pos_y2-st_pos_y1, fr_rail_dim_z], center = false);
                }

                // bar
                translate(v = [st_pos_x1, 0, fr_rail_dim_z]) {
                    cube(size = [st_pos_x2-st_pos_x1, st_pos_y2, st_bar_dim_z], center = false);
                }
            }
        }

        // hole
        translate(v = [-0.1, hl_connector_d/2, fr_display_delta_z + hl_connector_d/2]) {
            rotate(a = 90, v = [0, 1, 0]) {
                cylinder(h = (fr_dim_x - fr_display_dim_x)/2 + fr_feet_dim_x + 0.2, d = hl_connector_d, center = false, $fn = _fn);
            }
        }

        // hole inside frame
        translate(v = [0, 0, fr_display_delta_z]) {
            cube(size = [(fr_dim_x - fr_display_dim_x)/2 + fr_feet_dim_x + 0.1, hl_connector_d/2, hl_connector_d], center = false);
        }

        // hole at board
        translate(v = [h1_connector_dim_x, 0, fr_display_delta_z]) {
            cube(size = [abs(h1_connector_dim_x) + 0.01, hl_connector_d, fr_dim_z - fr_display_delta_z], center = false);
        }
    }
}


/*
    end of carDisplayTray.scad
*/
