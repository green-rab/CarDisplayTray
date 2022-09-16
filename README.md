# Car Display Tray #

[[Overview](#overview)] [[Parameters](#parameters)] [[Result in action](#result)] [[HowTo - Resize4Rounding](#howToRounding)]

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
## Result in action

tbd

<a name="howToRounding"></a>
## HowTo - Resize4Rounding ##

The goal is to create a complex shape with rounded edges. Therefore the Minkowski-function is used. It uses a circle and goes around the shape, all in 2D. The edges are rounded but therefore the shape gets bigger by the radius of the circle.

![](pictures/carDisplayTray_howTo_overview.png)

![](pictures/carDisplayTray_howTo_overviewT.png)

![Use of the Minkowski-function](https://lucid.app/publicSegments/view/ffb4a4e9-ca06-4040-a4ad-bed78eb1dca3/image.png "Overview rounded edges")

One way is to use the Resize-function to scale the shape down. But in this scope it is not working sufficient, the result is distorted a little bit. To improve the result where the shape keeps its original dimensions the coordinates of every single point have to be adjusted before the use of the Minkowski-function.

Single steps for trigonometric calculation are explained below.

### Point 1 and 5: Lower and upper right edge ###

Only the radius of the circle for the rounded edges has to be add or substituted from the coordinates of the single points.

### Point 2 and 4: Lower and upper left edge ###

This problem is a little bit more complicated. The example describes the solution for point 4. But it is the same way for point 2. In both cases the distance $dy$ is the goal to achieve.

![Point 4: Calculate dy](https://lucid.app/publicSegments/view/4cc5a863-c1d5-4d18-a564-80384627b660/image.png "Point 4")

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

![Point 3: Calculate dy and dz](https://lucid.app/publicSegments/view/59a92d40-8ea4-4538-bf2f-7bab815a4b63/image.png "Point 3")

To solve this problem the angle $\beta$ has to be calculated. Therefore the already calculated angles $\alpha$ and $\gamma$ are used:

$$\beta = 180° - \alpha - \gamma$$

With the angle $\beta$ the distance $a$ from the edge of the shape to the center of the circle is calculated:

$$a = edge_r / sin(\beta / 2)$$

In the next step the angle $\delta$ is calculated as the angle of the line $a$ to the horizontal line or the y-axis illustrated by $dy$:

$$\delta = \gamma + (\beta/2) - 90°$$

The final step is to calculate the delta values $dy$ and $dz$ for both axes with the calculated distance $a$ and the angle $\delta$:

$$dy = cos(\delta) * a$$

$$dz = sin(\delta) * a$$