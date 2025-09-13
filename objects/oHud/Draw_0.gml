/// @desc Draw Countdown

#region Countdown Sprites
	
if (global.playerInit == false) {
	
	// Draw Sprite
	draw_sprite_ext(sCountdown, image_index, camera_get_view_width(view_camera[0]) / 2.8, camera_get_view_height(view_camera[0]) / 4, 1.25, 1.25, image_angle, c_white, 1);
	
	// Speed 
	image_speed = 0;
	
	// 3
	if (alarmA = 179) image_index = 0; 
	
	// 2
	if (alarmA = 120) image_index = 1; 
	
	// 1
	if (alarmA = 60) image_index = 2; 

		
}


#endregion
