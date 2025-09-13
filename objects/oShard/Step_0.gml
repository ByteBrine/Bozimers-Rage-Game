/// @desc Effects

// Rotate Sprite
image_angle += 1;

// Destroy
if place_meeting(x, y, oPlayer) {
	
	// Swap Sprite
	sprite_index = sShardBreak;

	// Rotate Sprite
	image_angle += 3;
	
	// Screenshake
	ScreenShake(3, 2);	
	
} 

