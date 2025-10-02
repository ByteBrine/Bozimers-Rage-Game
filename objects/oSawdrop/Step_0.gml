
// Floor
if (place_meeting(x, y + vsp, oWall)) {
	
	// Stop
	vsp = 0;
	
} else {
	
	// Gravity
	vsp += grv;
	
	// Move
	y += vsp;
	
}

// Hit
if (place_meeting(x, y, oPlayer)) {
	
	// Destory
	instance_destroy();
			
}