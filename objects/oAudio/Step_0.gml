/// @desc Play Music

// Local Variables
var _finalVol = global.MUS_VOL * global.MASTER_VOL;

// Play The Target Song
if songAsset != targetSongAsset {
	
	// Fade Out Previous Song
	if audio_is_playing(songInstance) {
		
		// Add Song Instance To Our Array Of Songs To Fade Out
		array_push(fadeOutInstances, songInstance);
		
		// Add Song Instance Starting Volume (So No Abrupt Changes In Volume)
		array_push(fadeOutInstVol, fadeInInstVol);
		
		// Add Fade Out Instances Fade Out Frames
		array_push(fadeOutInstTime, endFadeOutTime);
		
		// Reset The Song Instance And Song Asset Variables
		songInstance = noone;
		songAsset = noone;
		
	}
	
	// Play The Song, If The Old Track Has Faded Out
	if array_length(fadeOutInstances) == 0 {
	
		if audio_exists(targetSongAsset) {
	
			// Play Song & Store Instance ID
			songInstance = audio_play_sound(targetSongAsset, 4, true);
	
			// Start Volume At Zero
			audio_sound_gain(songInstance, 0, 0);
			fadeInInstVol = 0;
	
		}
	
	}
	
	// Set The Song Asset To Match The Target Song Asset
	songAsset = targetSongAsset;
	
}

/// Volume Control

	// Main Song Volume
	if audio_is_playing(songInstance) {
	
		// Fade The Song In
		if startFadeInTime > 0 {
		
			if fadeInInstVol < 1 { fadeInInstVol += 1 / startFadeInTime; } else fadeInInstVol = 1;
		
		} else { // Immediately Start Song If The Fade In Time Is 0 Frames
		
			fadeInInstVol = 1;
		
		}
	
		// Set The Gain
		audio_sound_gain(songInstance, fadeInInstVol * _finalVol, 0);
	
	}
	
	// Fading Songs Out
	for (var i = 0; i < array_length(fadeOutInstances); i++) {
		
		// Fade The Volume
		if fadeOutInstTime[i] > 0 {
			
			if fadeOutInstVol[i] > 0 { fadeOutInstVol[i] -= 1 / fadeOutInstTime[i]; };
			
		} else { // Immediately Cut Volume To Zero Otherwise
			
			fadeOutInstVol[i] = 0;
			
		}
		
		// Set The Gain
		audio_sound_gain(fadeOutInstances[i], fadeOutInstVol[i] * _finalVol, 0);
		
		// Stop The Song When It's Volume Is At Zero And Remove it From ALL Arrays
		if fadeOutInstVol[i] <= 0 {
			
			// Stop The Song
			if audio_is_playing(fadeOutInstances[i]) { audio_stop_sound(fadeOutInstances[i]); };
			
			// Remove It From The Arrays
			array_delete(fadeOutInstances, i, 1);
			array_delete(fadeOutInstVol, i, 1);
			array_delete(fadeOutInstTime, i, 1);
			
			// Set The Loop Back 1, Since We Just Deleted An Entry
			i--;
			
		}

	}
