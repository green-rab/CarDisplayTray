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
_fn           = 100;

// fr - frame
fr_dim_x           = 133.0; //mm
fr_delta_y         =  14.0; //mm
fr_dim_y1          =  68.0 + fr_delta_y; //mm
fr_dim_y2          =  87.0 + fr_delta_y; //mm
fr_dim_z           =  40.0; //mm ???????????????
fr_edge_r          =   5.0; //mm

fr_display_dim_x   = 122.5; //mm
fr_display_dim_y   =  78.0; //mm
fr_display_delta_z =   6.0; //mm

fr_rail_delta_x    =   1.5; //mm
fr_rail_pos_x1     =  31.5 - fr_rail_delta_x; //mm
fr_rail_pos_x2     = fr_rail_pos_x1 + 52.5 + (2 * fr_rail_delta_x); //mm
fr_rail_dim_z      =   6.1; //mm

// bd - board
bd_pos_x1          = -42.5; //mm
bd_pos_x2          =   8.5 + fr_dim_x; // mm
bd_pos_y1          = -17.5; //mm
bd_pos_y2          = -20.5; //mm
bd_pos_y3          = -15.0; //mm
bd_delta_z         =  -2.0; //mm
bd_pos_z1          =   0.0 + bd_delta_z; //mm
bd_pos_z2          =  33.0 + bd_delta_z; //mm
bd_pos_z3          =  45.5 + bd_delta_z; //mm
bd_edge_r          =   5.0; //mm

// st - slot
st_delta_x         =   3.0; //mm
st_pos_x1          =  58.0 + st_delta_x; //mm
st_pos_x2          = st_pos_x1 + 20.0 - (2 * st_delta_x); //mm
st_delta_y         =   1.0; //mm
st_pos_y1          =  32.0 + st_delta_y; //mm
st_pos_y2          = st_pos_y1 + 15.0 - (2 * st_delta_y); //mm
st_bar_dim_z       =   2.0; //mm


// call module
carDisplayTray();


module carDisplayTray() {
    union() {
        // frame
        difference() {
            //polygon([[0, 0], [0, fr_dim_y1], [fr_dim_x, fr_dim_y2], [fr_dim_x, 0]]);
            linear_extrude(height = fr_dim_z, convexity = 10) {
                minkowski() {
                    //polygon([[0, 0], [0, fr_dim_y1], [fr_dim_x, fr_dim_y2], [fr_dim_x, 0]]);
                    tmp_dy = ((fr_dim_y2-fr_dim_y1)/(fr_dim_x)) * fr_edge_r;

                    points = [
                        [fr_edge_r,      0],
                        [fr_edge_r,      fr_dim_y1-fr_edge_r+tmp_dy],
                        [fr_dim_x-fr_edge_r, fr_dim_y2-fr_edge_r-tmp_dy],
                        [fr_dim_x-fr_edge_r, 0]
                    ];

                    polygon(points, convexity = 10);

                    circle(r = fr_edge_r, $fn = _fn);
                }
            }

            // display
            translate(v = [fr_dim_x/2-fr_display_dim_x/2, 0, fr_display_delta_z]) {
                cube(size = [fr_display_dim_x, fr_display_dim_y, fr_dim_z], center = false);
            }

            // rail
            translate(v = [fr_rail_pos_x1, -0.1, -0.1]) {
                cube(size = [fr_rail_pos_x2-fr_rail_pos_x1, fr_dim_y2+0.2, fr_rail_dim_z+0.1], center = false);
            }
        }

        // board
        translate(v = [0, fr_delta_y, 0]) {
            difference() {
                translate(v = [bd_pos_x2, 0, 0]) {
                    rotate(a = -90, v = [0, 1, 0]) {
                              translate(v=[0,0,0.5]) #polygon([[bd_pos_z1, 0], [bd_pos_z1, bd_pos_y1], [bd_pos_z2, bd_pos_y2], [bd_pos_z3, bd_pos_y3], [bd_pos_z3, 0]], convexity = 10);
                        linear_extrude(height = (-bd_pos_x1)+bd_pos_x2, convexity = 10) {
                            minkowski() {
                                //tmp_dy1 = ((abs(bd_pos_y2)-abs(bd_pos_y1)+bd_edge_r)/(bd_pos_z2-bd_pos_z1+bd_edge_r)) * bd_edge_r;
                                //tmp_dy3 = ((abs(bd_pos_y2)-abs(bd_pos_y3)+bd_edge_r)/(bd_pos_z3-bd_pos_z2+bd_edge_r)) * bd_edge_r;
                                tmp_angle1 = atan((abs(bd_pos_y2)-abs(bd_pos_y1))/(bd_pos_z2-bd_pos_z1));
                                tmp_angle3 = atan((abs(bd_pos_y2)-abs(bd_pos_y3))/(bd_pos_z3-bd_pos_z2));
                                tmp_angle2 = 180 - tmp_angle1 - tmp_angle3;
                                tmp_x = bd_edge_r / sin(tmp_angle2/2);
                                tmp_angle2b = tmp_angle3 + tmp_angle2/2 - 90;
                                tmp_dy1 = cos(tmp_angle1) * bd_edge_r * (1 - sin(tmp_angle1));
                                tmp_dz2 = sin(tmp_angle2b)*tmp_x; //sin(tmp_angle2) * bd_edge_r;
                                tmp_dy2 = cos(tmp_angle2b)*tmp_x; //cos(tmp_angle2) * bd_edge_r;
                                //tmp_dy3 = bd_edge_r - tan(tmp_angle3) * bd_edge_r;
                                tmp_dy3 = cos(tmp_angle3) * bd_edge_r * (1 - sin(tmp_angle3));
                                //tmp_dy3 = cos(tmp_angle3) * bd_edge_r - sin(90-tmp_angle3) * sin(tmp_angle3) * bd_edge_r;
                                echo(tmp_angle1);
                                echo(tmp_angle3);
                                echo(tmp_dy1);
                                echo(tmp_dy2);
                                echo(tmp_dy3);
                                echo(tmp_x);

                                points = [
                                    [bd_pos_z1+bd_edge_r, -bd_edge_r],
                                [bd_pos_z1+bd_edge_r, bd_pos_y1+tmp_dy1],
                                    [bd_pos_z2-tmp_dz2,   bd_pos_y2+tmp_dy2],
                                    [bd_pos_z3-bd_edge_r, bd_pos_y3+tmp_dy3],
                                    [bd_pos_z3-bd_edge_r, -bd_edge_r]
                                ];

                                polygon(points, convexity = 10);

                                circle(r = bd_edge_r, $fn = _fn);
                            }
                        }
                    }
                }

                // cut off for frame
                translate(v = [0, -fr_delta_y, 0]) {
                    cube(size = [fr_dim_x, fr_delta_y+0.1, fr_dim_z], center = false);
                }
            }
        }

        // slot
        union() {
            // connector
            translate(v = [st_pos_x1, 0, 0]) {
                cube(size = [st_pos_x2-st_pos_x1, fr_delta_y, fr_rail_dim_z], center = false);
            }

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
}


/*
    end of carDisplayTray.scad
*/
