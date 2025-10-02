/// @desc Destroy
if (sprite_index == sRingBeamBreak) {

	// Spawn Blast
	if (!instance_exists(oBlast)) {
	
		instance_create_depth(x, y, -999, oBlast);
	
	}
	
	// Destroy
	instance_destroy();
	
}
