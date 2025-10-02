/// @desc Progress Dialogue

// Show
if (showing_dialog == false) {
	
	if (dialog.count() <= 0) {
		
		instance_destroy();
		instance_activate_object(oPause);
		return;
		
	}
	
	current_dialog = dialog.pop();
	showing_dialog = true;
	
} else { // Progress
	
	// Pause
	instance_deactivate_object(oPause);
	
	// Progress
	if (keyboard_check_released(key_next)) {
		
		showing_dialog = false;
		oAudio.menuupSnd = true;
		alpha = 0;
		
	}
	
}
