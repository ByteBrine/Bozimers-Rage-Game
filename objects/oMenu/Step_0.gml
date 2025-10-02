/// @desc Navigate Menu

var up     = keyboard_check_pressed(vk_up)    || keyboard_check_pressed(ord("W"));
var down   = keyboard_check_pressed(vk_down)  || keyboard_check_pressed(ord("S"));
var left   = keyboard_check_pressed(vk_left)  || keyboard_check_pressed(ord("A"));
var right  = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
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

#region Accept Input
if (accept) {
	
	// Previous
    var prev = menu_level;
	
	// Play sound
	oAudio.menuenterSnd = true;

    switch (menu_level) {
        
        // --- Main Menu ---
        case 0:
            switch (pos) {
                case 0: if (global.loop_pending) {
					
			        // Boss was beaten and loop hasn't triggered yet
			        global.current_stage = 0;
			        global.loop_pending = false; // consume the loop
			        TransitionStart(Stage1, sqfadeOut, sqfadeIn);

			    } else if (global.current_stage != 0) {
			        // Continue from current stage + 1
			        TransitionStart(global.current_stage + 4, sqfadeOut, sqfadeIn);

			    } else {
			        // Start from Stage 1
			        TransitionStart(Stage1, sqfadeOut, sqfadeIn);
			    }
				
				break; // begin
				case 1: if (global.unlocked == true) { TransitionStart(rSelect, sqfadeOut, sqfadeIn); } break; // if (global.current_stage == 25) 
                case 2: menu_level = 1; break;                               // options
                case 3: game_end(); break;                                   // quit
            }
        break;

        // --- Settings Menu ---
        case 1:
            switch (pos) {
                case 0: menu_level = 2; break; // visual
                case 1: menu_level = 3; break; // audio
            }
        break;

        // --- Visual Settings ---
        case 2:
            switch (pos) {
                case 0: 
                    window_set_fullscreen(!global.fullscreen); 
                    global.fullscreen = !global.fullscreen; 
                break; // fullscreen
                
                case 1: 
                    horrifi_enable(!global.filter); 
                    global.filter = !global.filter; 
                break; // filter
            }
        break;

        // --- Audio Settings ---
        case 3:
            switch (pos) {
                case 0: break; // master
                case 1: break; // music
                case 2: break; // sounds
            }
        break;
    }

    // reset position on menu change
    if (prev != menu_level) pos = 0;

    // refresh option count
    op_length = array_length(option[menu_level]);
}
#endregion

// Sound Adjustment
if (menu_level == 3) {
	
	// Master
	if (pos == 0) { 
		
		// Lower
		if left { global.MASTER_VOL -= 0.25; oAudio.menudownSnd = true; };
		
		// Raise
		if right { global.MASTER_VOL += 0.25; oAudio.menuupSnd = true; };
		
		// Clamp
		global.MASTER_VOL = clamp(global.MASTER_VOL, 0, 1);
		
		};
		
	// Music
	if (pos == 1) { 
		
		// Lower
		if left { global.MUS_VOL -= 0.25; oAudio.menudownSnd = true; };
		
		// Raise
		if right { global.MUS_VOL += 0.25; oAudio.menuupSnd = true; };
		
		// Clamp
		global.MUS_VOL = clamp(global.MUS_VOL, 0, 1);
		
		};
		
	// Sfx
	if (pos == 2) { 
		
		// Lower
		if left { global.SFX_VOL -= 0.25; oAudio.menudownSnd = true; };
		
		// Raise
		if right { global.SFX_VOL += 0.25; oAudio.menuupSnd = true; };
		
		// Clamp
		global.SFX_VOL = clamp(global.SFX_VOL, 0, 1);
		
		};		
}

// Go back
if (keyboard_check_pressed(vk_backspace)) && (menu_level != 0) {
	
	var prev = menu_level;
	
	// Play sound
	oAudio.menubackSnd = true;		
		
	// Save Settings
	SaveMeta();
		
	// Go Back
	if (menu_level == 1) { menu_level = 0; }
	if (menu_level == 2) || (menu_level == 3) || (menu_level == 4) { menu_level = 1; }
	
    // reset position on menu change
    if (prev != menu_level) pos = 0;

    // refresh option count
    op_length = array_length(option[menu_level]);	
		
}

