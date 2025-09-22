/// @desc Navigate Menu

var up     = keyboard_check_pressed(vk_up)    || keyboard_check_pressed(ord("W"));
var down   = keyboard_check_pressed(vk_down)  || keyboard_check_pressed(ord("S"));
var accept = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);

// Set Option Length
op_length = array_length(option[menu_level]);

// Move Pos
pos += down - up;

// Play Sound
if (up) oAudio.menuupSnd = true;
if (down) oAudio.menudownSnd = true;

// Wrap
if (op_length > 0) {
    if (pos >= op_length) pos = 0;
    if (pos < 0) pos = op_length - 1;
}

// Alpha
if (alpha != 0.95) {
	
	// Increase 
	alpha += 0.05;
	
	// Clamp
	alpha = clamp(alpha, 0, 0.75);
	
}

#region Accept Input
if (accept) {
	
	// Get Stage Data
	var stage_number = real(string_delete(room_get_name(room), 1, 5)); 
	global.current_level = stage_number - 1;
	global.level_complete[global.current_level] = 1;
	if (oPlayer.shard_collected) { global.level_shard[global.current_level] = 1; global.shard_count++; }
	global.current_stage = max(global.current_stage, global.current_level + 1);
	
	// Save
	SaveGame();	
	
	// Play sound
	oAudio.menuenterSnd = true;
	switch (pos) {
			
            case 0: 
			
				// Next Level
				if (global.freeplay == true) { 
		
					// Return To Level Select
					TransitionStart(rSelect, sqfadeOut, sqfadeIn);
		
					// Reset Toggle
					global.freeplay = false;
		
				} else {
		
				// Next Stage	
			    TransitionStart(room_next(room), sqfadeOut, sqfadeIn);
	
				}		
				
				// Destroy Menu
				instance_destroy(oResults);		
		
			break; // Continue
            case 1: room_restart(); instance_destroy(oResults); break; // Restart
            case 2: 

				// Main Menu
			    TransitionStart(rMenu, sqfadeOut, sqfadeIn);

				
				// Destroy Menu
				instance_destroy(oResults);
				
			break; // Exit
        }

}
#endregion