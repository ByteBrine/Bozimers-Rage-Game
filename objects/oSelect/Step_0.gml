/// @desc Use Menu

// Input
var up     = keyboard_check_pressed(vk_up)    || keyboard_check_pressed(ord("W"));
var down   = keyboard_check_pressed(vk_down)  || keyboard_check_pressed(ord("S"));
var accept = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);

// Option Count
op_length = array_length(option[menu_level]);


//Navigation
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
    var prev = menu_level;
	
	// Set Toggle
	global.freeplay = true;
	
	// Play sound
	oAudio.menuenterSnd = true;

    switch (menu_level) {
        
        // Worlds
        case 0:
            switch (pos) {
                case 0: menu_level = 1; break; 
                case 1: if (global.current_stage > 4)  { menu_level = 2; } break;                               
                case 2: if (global.current_stage > 9) { menu_level = 3; } break;     
				case 3: if (global.current_stage > 14) { menu_level = 4; } break;   
				case 4: if (global.current_stage > 19) { menu_level = 5; } break;   
				case 5: if (global.current_stage == 25) TransitionStart(Stage26, sqfadeOut, sqfadeIn); break;   
            }
        break;

        // Blue
        case 1:
            switch (pos) {
                case 0: TransitionStart(Stage1, sqfadeOut, sqfadeIn);  break; 
                case 1: TransitionStart(Stage2, sqfadeOut, sqfadeIn);  break; 
                case 2: TransitionStart(Stage3, sqfadeOut, sqfadeIn);  break;
				case 3: TransitionStart(Stage4, sqfadeOut, sqfadeIn);  break;
				case 4: TransitionStart(Stage5, sqfadeOut, sqfadeIn);  break;
            }
        break;
		
        // Green
        case 2:
            switch (pos) {
                case 0: TransitionStart(Stage6, sqfadeOut, sqfadeIn);  break; 
                case 1: TransitionStart(Stage7, sqfadeOut, sqfadeIn);  break; 
                case 2: TransitionStart(Stage8, sqfadeOut, sqfadeIn);  break;
				case 3: TransitionStart(Stage9, sqfadeOut, sqfadeIn);  break;
				case 4: TransitionStart(Stage10, sqfadeOut, sqfadeIn);  break;
            }
        break;
		
        // Yellow
        case 3:
            switch (pos) {
                case 0: TransitionStart(Stage11, sqfadeOut, sqfadeIn);  break; 
                case 1: TransitionStart(Stage12, sqfadeOut, sqfadeIn);  break; 
                case 2: TransitionStart(Stage13, sqfadeOut, sqfadeIn);  break;
				case 3: TransitionStart(Stage14, sqfadeOut, sqfadeIn);  break;
				case 4: TransitionStart(Stage15, sqfadeOut, sqfadeIn);  break;
            }
        break;


        // Orange
        case 4:
            switch (pos) {
                case 0: TransitionStart(Stage16, sqfadeOut, sqfadeIn);  break; 
                case 1: TransitionStart(Stage17, sqfadeOut, sqfadeIn);  break; 
                case 2: TransitionStart(Stage18, sqfadeOut, sqfadeIn);  break;
				case 3: TransitionStart(Stage19, sqfadeOut, sqfadeIn);  break;
				case 4: TransitionStart(Stage20, sqfadeOut, sqfadeIn);  break;
            }
        break;


        // Red
        case 5:
            switch (pos) {
                case 0: TransitionStart(Stage21, sqfadeOut, sqfadeIn);  break; 
                case 1: TransitionStart(Stage22, sqfadeOut, sqfadeIn);  break; 
                case 2: TransitionStart(Stage23, sqfadeOut, sqfadeIn);  break;
				case 3: TransitionStart(Stage24, sqfadeOut, sqfadeIn);  break;
				case 4: TransitionStart(Stage25, sqfadeOut, sqfadeIn);  break;
				case 5: menu_level = 0;
            }
        break;
		
    }

    // reset position on menu change
    if (prev != menu_level) pos = 0;

    // refresh option count
    op_length = array_length(option[menu_level]);
}
#endregion

// Go back
if (keyboard_check_pressed(vk_backspace)) {
	
	var prev = menu_level;
	
	// Play sound
	oAudio.menubackSnd = true;	
	
	// Return To Main
	if (menu_level == 0) { 
		
		// Set Toggle
		global.freeplay = false;	
		
		// Return To Main Menu
		TransitionStart(rMenu, sqfadeOut, sqfadeIn); 
		
		}	
		
	// Go Back
	if (menu_level == 1) || (menu_level == 2) || (menu_level == 3) || (menu_level == 4) || (menu_level == 5) { menu_level = 0; }
	
    // reset position on menu change
    if (prev != menu_level) pos = 0;

    // refresh option count
    op_length = array_length(option[menu_level]);	
		
}