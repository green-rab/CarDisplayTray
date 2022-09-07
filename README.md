# Car Display Tray #

[[Overview](#overview)] [[Parameters](#parameters)] [[HowTo rounded edges](#howToRoundedEdges)]

Designed for a BMW 520i from 1990. Integrates a display for a rear view camera and replaces the original drawer for cigarettes. When parking pull the drawer to the front, its hided during driving.

![Front view](pictures/carDisplayTray_front01.png "carDisplayTray_front01" width=400px)
![Back view](pictures/carDisplayTray_back01.png "carDisplayTray_back01" width=400px)

Software for cad construction: OpenSCAD 2015.03
- [https://openscad.org](https://openscad.org)
- [https://github.com/openscad/openscad](https://github.com/openscad/openscad)

<a name="overview"></a>
## Overview ##

Files of the script:

- __carDisplayTray.scad__ includes the module for generating the construction and specifies its parameters

Version history:

| Version | New features                   | Resolved bugs |
| ------- | ------------------------------ | ------------- |
| v0.1    | first version for initial test | -             |

<a name="parameters"></a>
## Parameters of the script ##

General parameters:

| Name               | Description                                     |
| ------------------ | ----------------------------------------------- |
| _fn                | Resolution of rounded edges                     |

Parameters for the section 'frame':

| Name               | Description                                     |
| ------------------ | ----------------------------------------------- |
| fr_dim_x           | x-dimension outer edge                          |
| fr_delta_y         | Additional expansion for display in y-dimension |
| fr_dim_y1          | y-dimension outer edge left side                |
| fr_dim_y2          | y-dimension outer edge right side               |
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

Parameters for the section 'board':

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

Parameters for the section 'slot':

| Name               | Description                                     |
| ------------------ | ----------------------------------------------- |
| st_delta_x         | Tolerance for slot in x-dimension               |
| st_delta_y         | Tolerance for slot in y-dimension               |
| st_pos_x1          | Left position of slot for fixation in channel   |
| st_pos_x2          | Right position of slot for fixation in channel  |
| st_pos_y1          | Front position of slot for fixation in channel  |
| st_pos_y2          | Back position of slot for fixation in channel   |
| st_bar_dim_z       | z-dimension of the bar to connect the fixation  |

Parameters for the section 'hole':

| Name               | Description                                     |
| ------------------ | ----------------------------------------------- |
| hl_connector_d     | Diameter for hole for connector and wire        |
| hl_connector_dim_x | x-dimension for hole cutting off the board      |

<a name="howToRoundedEdges"></a>
## HowTo - Resize objects with rounded edges ##

The goal is to create a complex shape with rounded edges. Therefore the Minkowski-function is used. It uses a circle and goes around the shape, all in 2D. The edges are rounded but therefore the shape gets bigger by the radius of the circle.

![Use of the Minkowski-function](https://lucid.app/publicSegments/view/ffb4a4e9-ca06-4040-a4ad-bed78eb1dca3/image.png "Overview round edges" width=400px)

One way is to use the Resize-function to scale the shape down. But in this scope it is not working sufficient, the result is distorted a little bit. To improve the result where the shape keeps its original dimensions the coordinates of every single point have to be adjusted before the use of the Minkowski-function.

Single steps for trigonometric calculation are explained below.

### Point 1 and 5: Lower and upper right edge ###

Only the radius of the circle for the rounded edges has to be add or substituted from the coordinates of the single points.

### Point 2 and 4: Lower and upper left edge ###

This problem is a little bit more complicated. The example describes the solution for point 4. But it is the same way for point 2. In both cases the distance $dy$ is the goal to achieve.

![Point 4: Calculate $dy$](https://lucid.app/publicSegments/view/4cc5a863-c1d5-4d18-a564-80384627b660/image.png "Point 4" width=600px)

First the angle $\gamma$ has to be calculated by the adjacent and opposite side of a right triangle:

$$\gamma = atan[(y_{pt4} - y_{pt3}) / (z_{pt4} - z_{pt3})]$$

The marked point on the circle has to fit the shape. There is a right angle crossing the shape from the center of the circle to its border with the length $edge_r$. Because of the right angle the angle $\gamma$ is the same and the distance $a$ is als follows:

$$a = cos(\gamma) * edge_r$$

Next the distance $b$ on the z-axis to the center point has to be calculated. The subtraction by the radius $edge_r$ let to the opposite $c$ of the right triangle on the top:

$$b = sin(\gamma) * edge_r$$

$$c = sin(\gamma) * (edge_r - b)$$

The final value $dy$ can now be calculated the subtraction of the values $a$ and $c$:

$$dy = a - c$$

### Point 3: Middle left edge ###

In this case the circle has to be moved in two directions to fit to the shape. But only one distance is needed to calculate the values $dy$ and $dz$.

![Point 3: Calculate $dy$ and $dz$](https://lucid.app/publicSegments/view/59a92d40-8ea4-4538-bf2f-7bab815a4b63/image.png "Point 3" width=400px)

To solve this problem the angle $\beta$ has to be calculated. Therefore the already calculated angles $\alpha$ and $\gamma$ are used:

$$\beta = 180° - \alpha - \gamma$$

With the angle $\beta$ the distance $a$ from the edge of the shape to the center of the circle is calculated:

$$a = edge_r / sin(\beta / 2)$$

In the next step the angle $\delta$ is calculated as the angle of the line $a$ to the horizontal line or the y-axis illustrated by $dy$:

$$\delta = \gamma + (\beta/2) - 90°$$

The final step is to calculate the delta values $dy$ and $dz$ for both axes with the calculated distance $a$ and the angle $\delta$:

$$dy = cos(\delta) * a$$

$$dz = sin(\delta) * a$$