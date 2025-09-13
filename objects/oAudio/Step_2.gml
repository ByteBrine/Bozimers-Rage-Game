/// @desc Play Sounds

// Get Volume
var _sfxVol = global.SFX_VOL * global.MASTER_VOL;

// Rings Sound
if (ringSnd == true) {
	
	// Play Sound
	var _snd = audio_play_sound(aRing, 8, false);
	
	// Set Volume
	audio_sound_gain(_snd, _sfxVol, 0);
	
	// Reset Var
	ringSnd = false;
	
}

// Swap Sound
if (swapSnd == true) {
	
	// Play Sound
	var _snd = audio_play_sound(aSwap, 8, false);
	
	// Set Volume
	audio_sound_gain(_snd, _sfxVol, 0);
	
	// Reset Var
	swapSnd = false;
	
}

// Shard Sound
if (shardSnd == true) {
	
	// Play Sound
	var _snd = audio_play_sound(aShardGet, 8, false);
	
	// Set Volume
	audio_sound_gain(_snd, _sfxVol, 0);	
	
	// Reset Var
	shardSnd = false;
	
}

// Jump Sound
if (jumpSnd == true) {
	
	// Play Sound
	var _snd = audio_play_sound(aPlayerJump, 8, false);
	
	// Set Volume
	audio_sound_gain(_snd, _sfxVol, 0);	
	
	// Reset Var
	jumpSnd = false;
	
}

// Death Sound
if (deathSnd == true) {
	
	// Play Sound
	var _snd = audio_play_sound(aPlayerDead, 8, false);
	
	// Set Volume
	audio_sound_gain(_snd, _sfxVol, 0);	
	
	// Reset Var
	deathSnd = false;
	
}

// Countdown Sound
if (countdownSnd == true) {
	
	// Play Sound
	var _snd = audio_play_sound(aCountdown, 8, false);
	
	// Set Volume
	audio_sound_gain(_snd, _sfxVol, 0);	
	
	// Reset Var
	countdownSnd = false;
	
}

// Countdown Sound
if (countgoSnd == true) {
	
	// Play Sound
	var _snd = audio_play_sound(aCountGo, 8, false);
	
	// Set Volume
	audio_sound_gain(_snd, _sfxVol, 0);	
	
	// Reset Var
	countgoSnd = false;
	
}
	
// Menu Nav Up Sound
if (menuupSnd == true) {
	
	// Play Sound
	var _snd = audio_play_sound(aMenuUp, 8, false);
	
	// Set Volume
	audio_sound_gain(_snd, _sfxVol, 0);	
	
	// Reset Var
	menuupSnd = false;
	
}

// Menu Nav Down Sound
if (menudownSnd == true) {
	
	// Play Sound
	var _snd = audio_play_sound(aMenuDown, 8, false);
	
	// Set Volume
	audio_sound_gain(_snd, _sfxVol, 0);	
	
	// Reset Var
	menudownSnd = false;
	
}

// Menu Nav Enter Sound
if (menuenterSnd == true) {
	
	// Play Sound
	var _snd = audio_play_sound(aMenuEnter, 8, false);
	
	// Set Volume
	audio_sound_gain(_snd, _sfxVol, 0);	
	
	// Reset Var
	menuenterSnd = false;
	
}

// Menu Nav Back Sound
if (menubackSnd == true) {
	
	// Play Sound
	var _snd = audio_play_sound(aMenuBack, 8, false);
	
	// Set Volume
	audio_sound_gain(_snd, _sfxVol, 0);	
	
	// Reset Var
	menubackSnd = false;
	
}