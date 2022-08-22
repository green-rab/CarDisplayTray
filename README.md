# Car Display Tray #

Modelling a drawer for a display of a rear camera. Designed for a BMW 520i from 1990. Replaces the original drawer for cigarettes and hides the display during drive. For parking pull the drawer to you where the display is integrated

![Final car display tray](pictures/tbd.png)

Software for cad construction: OpenSCAD 2015.03
- [https://openscad.org](https://openscad.org)
- [https://github.com/openscad/openscad](https://github.com/openscad/openscad)

## Overview ##

Files of the script:

- __carDisplayTray.scad__ includes the module for generating the construction and specifies its parameter's

Version history:

| Version | New features | Resolved bugs |
| ------- | ------------ | ------------- |
| v0.1    | tbd          | tbd           |

Improvements for next version:

- [ ] tbd

## Parameters of the script ##

General parameters:

| Name               | Description                                     |
| ------------------ | ----------------------------------------------- |
| _fn                | Resolution of rounded edges                     |

Parameters for section 'frame':

| Name               | Description                                     |
| ------------------ | ----------------------------------------------- |
| fr_dim_x           | x-dimension outer edge                          |
| fr_delta_y         | Additional expansion for display in y-dimension |
| fr_dim_y1          | y-dimension outer edge left side                |
| fr_dim_y2          | y-dimension outer edge  right side              |
| fr_dim_z           | z-dimension outer edge                          |
| fr_edge_r          | Radius of the rounded edges                     |
| fr_display_dim_x   | x-dimension of display                          |
| fr_display_dim_y   | y-dimension of display                          |
| fr_display_delta_z | Distance display from the bottom                |
| fr_rail_delta_x    | Additional expansion for rail in x-dimension    |
| fr_rail_pos_x1     | Left position of rail for locking channel       |
| fr_rail_pos_x1     | Right position of rail for locking channel      |
| fr_rail_dim_z      | z-dimension of rail                             |

Parameters for section 'board':

| Name               | Description                                     |
| ------------------ | ----------------------------------------------- |
| bd_pos_x1          | Left position in x-dimension                    |
| bd_pos_x2          | Right position in x-dimension                   |
| bd_pos_y1          | Bottom position in y-dimension                  |
| bd_pos_y2          | Middle position in y-dimension (arrow-shape)    |
| bd_pos_y3          | Top position in y-dimension                     |
| bd_pos_z1          | Bottom position in z-dimension                  |
| bd_pos_z2          | Middle position in z-dimension (arrow-shape)    |
| bd_pos_z3          | Top position in z-dimension                     |
| bd_edge_r          | Radius of the rounded edges                     |

Parameters for section 'slot':

| Name               | Description                                     |
| ------------------ | ----------------------------------------------- |
| st_delta_x         | Tolerance for slot in x-dimension               |
| st_pos_x1          | Left position of slot for fixation in channel   |
| st_pos_x2          | Right position of slot for fixation in channel  |
| st_delta_y         | Tolerance for slot in y-dimension               |
| st_pos_y1          | Front position of slot for fixation in channel  |
| st_pos_y2          | Back position of slot for fixation in channel   |
| st_bar_dim_z       | z-dimension of the bar to connect the fixation  |

## [EPIC] Resize objects with rounded edges ##

tbd
