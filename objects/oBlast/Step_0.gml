
// Move
x = lerp(x, oBozi.x, 0.5);
y = lerp(y, oBozi.y, 0.5);

// Hit
if (place_meeting(x, y, oBozi)) {
			
	// Damage
	oBozi.hp -= 1;
	
	// Timer
	oBozi.hurt_timer = 30;
	
	// Shake
	ScreenShake(2, 60);
	
	// Audio
	oAudio.hitSnd = true;
	
	// Destory
	instance_destroy();
			
}