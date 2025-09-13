/// @desc Cam Use & Shake

// Exit if no player...
if !instance_exists(follow) exit;

// Get camera size
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

// Get camera target cords.
if (follow.dir == 1) {
	
	var _camX = follow.x - _camWidth / 2.5; 

} else {
	
	var _camX = follow.x - _camWidth / 1.5; 
	
}
var _camY = follow.y - _camHeight / 2;

// Constrain camera to room borders
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

// Screenshake Offset
_camX += random_range(-shake_remain, shake_remain);
_camY += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));


// Set camera cords.
camera_set_view_pos(view_camera[0], _camX, _camY);



