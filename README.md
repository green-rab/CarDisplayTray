# Car Display Tray #

[[Overview](#overview)] [[Parameters](#parameters)] [[Result](#result)] [[HowTo - Resize4Rounding](#howToRounding)]

The 3D-model is designed for a BMW 520i from 1990 and integrates a display for a rear view camera by replacing the original drawer for cigarettes. During parking you have to pull the tray to you for watching the display for the camera in the back. During driving the display is hidden in the center console of the car.

Software for cad construction: OpenSCAD 2015.03
- [https://openscad.org](https://openscad.org)
- [https://github.com/openscad/openscad](https://github.com/openscad/openscad)

<a name="overview"></a>
## Overview ##

| Rendered front view | ... and back view of the tray |
| :-----------------: | :---------------------------: |
| ![](pictures/carDisplayTray_front01.png) | ![](pictures/carDisplayTray_back01.png) |

Files of the script:

- __carDisplayTray.scad__ includes the module for generating the construction and specifies its parameters

Version history:

| Version | New features                   | Resolved bugs |
| :-----: | :----------------------------- | :------------ |
| v0.1    | first version for initial test | none          |

<a name="parameters"></a>
## Parameters ##

Description of used parameters in the script.

| frame | board | slot | hole |
| :---: | :---: | :--: | :--: |
| ![](pictures/carDisplayTray_partFrame01.png) | ![](pictures/carDisplayTray_partBoard01.png) | ![](pictures/carDisplayTray_partSlot01.png) | ![](pictures/carDisplayTray_partHole01.png) |

<details>
<summary>General parameters</summary>
<br>
<table>
	<tr>
		<th>Name</th>
		<th>Description</th>
	</tr>
	<tr>
		<td>_fn</td>
		<td>Resolution of rounded edges</td>
	</tr>
</table>
<br>
</details>

<details>
<summary>Parameters for the part 'frame'</summary>
<br>
<table>
	<tr>
		<th>Name</th>
		<th>Description</th>
	</tr>
	<tr>
		<td>fr_dim_x</td>
		<td>x-dimension outer edge</td>
	</tr>
	<tr>
		<td>fr_delta_y</td>
		<td>Additional expansion for display in y-dimension</td>
	</tr>
	<tr>
		<td>fr_dim_y1</td>
		<td>y-dimension outer edge left side</td>
	</tr>
	<tr>
		<td>fr_dim_y2</td>
		<td>y-dimension outer edge right side</td>
	</tr>
	<tr>
		<td>fr_dim_z</td>
		<td>z-dimension outer edge</td>
	</tr>
	<tr>
		<td>fr_edge_r</td>
		<td>Radius of the rounded edges</td>
	</tr>
	<tr>
		<td>fr_display_dim_x</td>
		<td>x-dimension of display</td>
	</tr>
	<tr>
		<td>fr_display_dim_y</td>
		<td>y-dimension of display</td>
	</tr>
	<tr>
		<td>fr_display_delta_z</td>
		<td>Distance display from the bottom</td>
	</tr>
	<tr>
		<td>fr_rail_delta_x</td>
		<td>Additional expansion for rail in x-dimension</td>
	</tr>
	<tr>
		<td>fr_rail_pos_x1</td>
		<td>Left position of rail for locking channel</td>
	</tr>
	<tr>
		<td>fr_rail_pos_x2</td>
		<td>Right position of rail for locking channel</td>
	</tr>
	<tr>
		<td>fr_rail_dim_z</td>
		<td>z-dimension of rail</td>
	</tr>
	<tr>
		<td>fr_feet_dim_x</td>
		<td>x-dimension for feet for display at the side</td>
	</tr>
	<tr>
		<td>fr_feet_dim_z</td>
		<td>z-dimension for feet for display at the side</td>
	</tr>
</table>
<br>
</details>

<details>
<summary>Parameters for the part 'board'</summary>
<br>
<table>
	<tr>
		<th>Name</th>
		<th>Description</th>
	</tr>
	<tr>
		<td>bd_pos_x1</td>
		<td>Left position in x-dimension</td>
	</tr>
	<tr>
		<td>bd_pos_x2</td>
		<td>Right position in x-dimension</td>
	</tr>
	<tr>
		<td>bd_pt1_pos_y</td>
		<td>Point 1 position in y-dimension</td>
	</tr>
	<tr>
		<td>bd_pt1_pos_z</td>
		<td>Point 1 position in z-dimension</td>
	</tr>
	<tr>
		<td>bd_pt2_pos_y</td>
		<td>Point 2 position in y-dimension</td>
	</tr>
	<tr>
		<td>bd_pt2_pos_z</td>
		<td>Point 2 position in z-dimension</td>
	</tr>
	<tr>
		<td>bd_pt3_pos_y</td>
		<td>Point 3 position in y-dimension</td>
	</tr>
	<tr>
		<td>bd_pt3_pos_z</td>
		<td>Point 3 position in z-dimension</td>
	</tr>
	<tr>
		<td>bd_pt4_pos_y</td>
		<td>Point 4 position in y-dimension</td>
	</tr>
	<tr>
		<td>bd_pt4_pos_z</td>
		<td>Point 4 position in z-dimension</td>
	</tr>
	<tr>
		<td>bd_pt5_pos_y</td>
		<td>Point 5 position in y-dimension</td>
	</tr>
	<tr>
		<td>bd_pt5_pos_z</td>
		<td>Point 5 position in z-dimension</td>
	</tr>
	<tr>
		<td>bd_edge_r</td>
		<td>Radius of the rounded edges</td>
	</tr>
</table>
<br>
</details>

<details>
<summary>Parameters for the part 'slot'</summary>
<br>
<table>
	<tr>
		<th>Name</th>
		<th>Description</th>
	</tr>
	<tr>
		<td>st_delta_x</td>
		<td>Tolerance for slot in x-dimension</td>
	</tr>
	<tr>
		<td>st_delta_y</td>
		<td>Tolerance for slot in y-dimension</td>
	</tr>
	<tr>
		<td>st_pos_x1</td>
		<td>Left position of slot for fixation in channel</td>
	</tr>
	<tr>
		<td>st_pos_x2</td>
		<td>Right position of slot for fixation in channel</td>
	</tr>
	<tr>
		<td>st_pos_y1</td>
		<td>Front position of slot for fixation in channel</td>
	</tr>
	<tr>
		<td>st_pos_y2</td>
		<td>Back position of slot for fixation in channel</td>
	</tr>
	<tr>
		<td>st_bar_dim_z</td>
		<td>z-dimension of the bar to connect the fixation</td>
	</tr>
</table>
<br>
</details>

<details>
<summary>Parameters for the part 'hole'</summary>
<br>
<table>
	<tr>
		<th>Name</th>
		<th>Description</th>
	</tr>
	<tr>
		<td>hl_connector_d</td>
		<td>Diameter for hole for connector and wire</td>
	</tr>
	<tr>
		<td>hl_connector_dim_x</td>
		<td>x-dimension for hole cutting off the board</td>
	</tr>
</table>
<br>
</details>

<a name="result"></a>
## Result

tbd

<a name="howToRounding"></a>
## HowTo - Resize4Rounding ##

The goal is to create a complex shape with rounded edges. Therefore the Minkowski-function is used that rotates a circle around the whole shape. The radius of the circle is then the rounding of the single edges, all in 2D. The problem that has to be solved is that the center of the circle is exactly on the contour of the shat that depends that the result shape is larger than the original one.

One way is to use the implemented Resize-function to scale the shape down before or after the use of the Minkowski-function. But for this problem it is not working sufficient. After resizing the shape is distorted a little bit.

To improve the result where the shape keeps its original dimensions the coordinates of every single point has to be adjusted before the use of the Minkowski-function. So the shape is manually scaled down before the use of the Minkowski-function to get the shape with its desired dimension after using it.

![Overview of single points that have to be calculated for the board](pictures/carDisplayTray_howTo_overview.png)


The single steps for trigonometric calculation are explained below.

### Point 1 and 5 ###

For the first points only the radius of the circle has to be added or substituted to the coordinates. That's easy.

### Point 2 and 4 - calculate delta dy ###

This problem is a little bit more complicated. The example describes the solution for point 4 and it is the same way for point 2. In both cases the distance $dy$ is the goal to achieve that is the difference in y-direction that has to be added to the coordinate of the edge.

![](pictures/carDisplayTray_howto_point4.png)

First the angle $\gamma$ has to be calculated by the adjacent and opposite side of a right triangle:

$$\gamma = atan[(y_{pt4} - y_{pt3}) / (z_{pt4} - z_{pt3})]$$

The marked point on the circle has to fit the shape. There is a right angle crossing the shape from the center of the circle to its border with the length $r_edge$. Because of the right angle the angle $\gamma$ is the same and the distance $a$ is als follows:

$$a = cos(\gamma) * r_edge$$

Next the distance $b$ on the z-axis to the center point has to be calculated. The subtraction by the radius $r_edge$ let to the opposite $c$ of the right triangle on the top:

$$b = sin(\gamma) * r_edge$$

$$c = sin(\gamma) * (r_edge - b)$$

The final value $dy$ can now be calculated the subtraction of the values $a$ and $c$:

$$dy = a - c$$

### Point 3 - calculate delta dy and dz ###

In this case the circle has to be moved in two directions to fit to the shape. But only one distance is needed to calculate the values $dy$ and $dz$.

![](pictures/carDisplayTray_howto_point3.png)

To solve this problem the angle $\beta$ has to be calculated. Therefore the already calculated angles $\alpha$ and $\gamma$ are used:

$$\beta = 180° - \alpha - \gamma$$

With the angle $\beta$ the distance $a$ from the edge of the shape to the center of the circle is calculated:

$$a = r_edge / sin(\beta / 2)$$

In the next step the angle $\delta$ is calculated as the angle of the line $a$ to the horizontal line or the y-axis illustrated by $dy$:

$$\delta = \gamma + (\beta/2) - 90°$$

The final step is to calculate the delta values $dy$ and $dz$ for both axes with the calculated distance $a$ and the angle $\delta$:

$$dy = cos(\delta) * a$$

$$dz = sin(\delta) * a$$