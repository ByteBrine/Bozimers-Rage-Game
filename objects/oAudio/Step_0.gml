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
	
/// Te Music

	if room == Stage1
	|| room == Stage2
	|| room == Stage3
	|| room == Stage4
	|| room == Stage5 {
	
		set_song_ingame(aBlue, 60, 180);
	
	}

	if room == Stage6
	|| room == Stage7
	|| room == Stage8
	|| room == Stage9
	|| room == Stage10 {
	
		set_song_ingame(aGreen, 60, 180);
	
	}

	if room == Stage11
	|| room == Stage12
	|| room == Stage13
	|| room == Stage14
	|| room == Stage15 {
	
		set_song_ingame(aYellow, 60, 180);
	
	}

	if room == Stage16
	|| room == Stage17
	|| room == Stage18
	|| room == Stage19
	|| room == Stage20 {
	
		set_song_ingame(aOrange, 60, 180);
	
	}

	if room == Stage21
	|| room == Stage22
	|| room == Stage23
	|| room == Stage24
	|| room == Stage25 {
	
		set_song_ingame(aRed, 60, 180);
	
	}
	
	if room == Stage26 {
		
		set_song_ingame(aBoss, 60, 180);
		
	}

	
	if room == rMenu
	|| room == rSelect {
	
		set_song_ingame(noone, 3 * 60);
	
	}
	
	if (instance_exists(oDialogParent)) {
		
		set_song_ingame(noone, 2 * 60);
		
	}