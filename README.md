# Car Display Tray #

Modeling a drawer for a display of a rear camera. Designed for a BMW 520i from 1990. Replaces the original drawer for cigarettes and hides the display during drive. For parking pull the drawer to you where the display is integrated

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
| fr_feet_dim_x      | x-dimension for feet for display at the side    |
| fr_feet_dim_z      | z-dimension for feet for display at the side    |

Parameters for section 'board':

| Name               | Description                                     |
| ------------------ | ----------------------------------------------- |
| bd_pos_x1          | Left position in x-dimension                    |
| bd_pos_x2          | Right position in x-dimension                   |
| bd_pt1_pos_y       | Point 1 position in y-dimension                 |
| bd_pt1_pos_z       | Point 1 position in z-dimension                 |
| bd_pt2_pos_y       | Point 2 position in y-dimension                 |
| bd_pt2_pos_z       | Point 2 position in z-dimension                 |
| bd_pt3_pos_y       | Point 3 position in y-dimension                 |
| bd_pt3_pos_z       | Point 3 position in z-dimension                 |
| bd_pt4_pos_y       | Point 4 position in y-dimension                 |
| bd_pt4_pos_z       | Point 4 position in z-dimension                 |
| bd_pt5_pos_y       | Point 5 position in y-dimension                 |
| bd_pt5_pos_z       | Point 5 position in z-dimension                 |
| bd_edge_r          | Radius of the rounded edges                     |

Parameters for section 'slot':

| Name               | Description                                     |
| ------------------ | ----------------------------------------------- |
| st_delta_x         | Tolerance for slot in x-dimension               |
| st_delta_y         | Tolerance for slot in y-dimension               |
| st_pos_x1          | Left position of slot for fixation in channel   |
| st_pos_x2          | Right position of slot for fixation in channel  |
| st_pos_y1          | Front position of slot for fixation in channel  |
| st_pos_y2          | Back position of slot for fixation in channel   |
| st_bar_dim_z       | z-dimension of the bar to connect the fixation  |

Parameters for section 'hole':

| Name               | Description                                     |
| ------------------ | ----------------------------------------------- |
| hl_connector_d     | Diameter for hole for connector and wire        |
| h1_connector_dim_x | x-dimension for hole cutting off the board      |

## [EPIC] Resize objects with rounded edges ##

The goal is to create a complex shape with rounded edges. Therefore the Minkowski function is used that uses a circle and goes round the shape. The edges are rounded but the shape is bigger as before because of the radius of the circle that is the radius of the corners too.

![Use of the Minkowski function](https://lucid.app/publicSegments/view/ffb4a4e9-ca06-4040-a4ad-bed78eb1dca3/image.png "Overview round edges")

One way is using the Resize function to scale the shape down. But here it is not working sufficient. To get the result where the shape keeps its the coordinated of the single points are adjusted before the use of the Minkowski function.

Single steps for calculation are explained below.

### Point 1 and 5: Lower and upper right edge ###

This one is easy. Only the radius of the circle for the rounding edge has to be add or substituted from the single points in each direction.

### Point 2 and 4: Lower and upper left edge ###

This problem is a little bit more complicated. To solve the problem the angle gamma has to be calculated and then some distances a, b and c before the desired distance dy is calculated.

The example describes the upper point 4:

![Point 4: Calculation of dy](https://lucid.app/publicSegments/view/4cc5a863-c1d5-4d18-a564-80384627b660/image.png "Point 4")

The angle gamma can be calculated by the adjacent and opposite side of a right triangle

$$\gamma = atan[(y_{pt4} - y_{pt3}) / (z_{pt4} - z_{pt3})]$$

First calculating the distance at y-axis for the point on the circle that has to fit the shape. There is a right angle crossing the shape from the center of the circle to its border:

$$a = cos(\gamma) * edge_r$$

Next the distance for the z-axis is calculated. Its used to calculate the distance from the center axis of the circle to the border of the shape:

$$b = sin(\gamma) * edge_r$$

$$c = sin(\gamma) * (edge_r - b)$$

By the substract of both values the distance for moving the shape coordinate at the y-axis is found:

$$dy = a - c$$

### Point 3: Middle left edge ###

To solve the problem the angle beta and delta have to be calculated. Only one distance is needed to calculate the delta values dy and dz. In this case the circle has moved in two directions to fit to the shape.

![Point 3: Calculation of dy and dz](https://lucid.app/publicSegments/view/59a92d40-8ea4-4538-bf2f-7bab815a4b63/image.png "Point 3")

The angle beta can be calculated by the using the already calculated angles alpha and gamma:

$$\beta = 180° - \alpha - \gamma$$

With this angle the distance from the edge of the shape to the center of the circle is calculated:

$$a = edge_r / sin(\beta / 2)$$

Next the angle delta is calculated as the angle of the line a to the horizontal line:

$$\delta = \gamma + (\beta/2) - 90°$$

The last steps is simple. The angle can the hypotenuses are now available that allows to calculate the delta values for the y-axis and here the z-axis too:

$$dy = cos(\delta) * a$$

$$dz = sin(\delta) * a$$