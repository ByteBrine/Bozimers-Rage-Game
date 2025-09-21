/// @desc ScreenShake(Magnitude, Frames)
function ScreenShake(_Magnitude, _Frames) {
	
	with (oCamera) {
		
		if (argument0 > shake_remain) {
			
			shake_magnitude = argument0;
			shake_remain = argument0;
			shake_length = argument1;
									
		}
		
	}
	
}

function set_song_ingame(_song, _fadeOutCurrentSong = 0, _fadeIn = 0) {
	//_song = set to any song (including "noone" to stop or fade the track out)
	//_fadeOutCurrentSong = time (in frames) the current song (if playing) will take to fade out
	//_fadeIn = time (in frames) the traget song (if not "noone") will take to fade in
	
	with (oAudio) {
		
		targetSongAsset = _song;
		endFadeOutTime = _fadeOutCurrentSong;
		startFadeInTime = _fadeIn;
		
	}
	
}
