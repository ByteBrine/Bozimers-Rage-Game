/// @desc On End

// Run Countdown
if (alarmA > 0) && (!instance_exists(oDialogParent)) && (instance_exists(oAudio)) {
	
	// Can't Pause
	instance_deactivate_object(oPause);
	
	// Countdown
	alarmA -= alarmSpd;
	
	// Toggle
	global.playerInit = false;
	
	// 3
	if (alarmA == 179) oAudio.countdownSnd = true;
	
	// 2
	if (alarmA == 120) oAudio.countdownSnd = true;
	
	// 1
	if (alarmA == 60) oAudio.countdownSnd = true;
	
	// Go
	if (alarmA <= 0) {
		
		// Can Pause
		instance_activate_object(oPause);		
		
		// Sound
		oAudio.countgoSnd = true;
		
		// Toggle
		global.playerInit = true;
		
	}
	
}
	
// Pause Options
with (oPause) {
	
	if (pause == true) {
		
		// Restart Stage
		if (keyboard_check_pressed(ord("R"))) {
		
			// Unpause
			pause = false;
			
			// Reactivate Instances
			instance_activate_all();
		
			// Reset
			room_restart();
					

		}

	}
	
}