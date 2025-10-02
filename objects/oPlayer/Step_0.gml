/// @desc Run State Machine

// Get Input
if (keyboard_check_pressed(vk_space) 
 || keyboard_check_pressed(ord("W")) 
 || keyboard_check_pressed(vk_up)) {
    jumpBuffer = jumpBufferMax; // store jump
}

// Decrease buffer every frame
if (jumpBuffer > 0) jumpBuffer--;
 
// Run states
if (global.playerInit == true) & (!instance_exists(oDialogParent)) {

	switch (state) {
	
		case PLAYER.RUN: PLAYER_RUN(); break;
	
		case PLAYER.DASH: PLAYER_DASH(); break;
	
		case PLAYER.DEAD: PLAYER_DEAD(); break;
	
		case PLAYER.FINISH: PLAYER_FINISH(); break;
	
	}

} else {
	
	// Sprite
    sprite_index = sPlayerIdle;
		
	// Freeze Player
    hsp = 0; vsp = 0;
		
}

// Sprite Direction
image_xscale = dir;

// Sawp Switch
if place_meeting(x, y, oSwap) { 
	
	// Dir
	dir = -dir; 
	
	// Sfx
	oAudio.swapSnd = true;
	
	}
