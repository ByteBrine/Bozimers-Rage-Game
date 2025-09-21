/// @desc Audio Set-up

// SFX
ringSnd = false;
shardSnd = false;
swapSnd = false;
jumpSnd = false;
deathSnd = false;
countdownSnd = false;
countgoSnd = false;
menuupSnd = false;
menudownSnd = false;
menuenterSnd = false;
menubackSnd = false;


// Info Of Current Track
songInstance = noone;
songAsset = noone;
targetSongAsset = noone;
endFadeOutTime = 0; // [FRAMES]
startFadeInTime = 0; // [FRAMES]
fadeInInstVol = 1;

// Fade Track Out
fadeOutInstances = array_create(0); // Inst. To Fade Out
fadeOutInstVol =  array_create(0); // Volume Of Each Instances
fadeOutInstTime = array_create(0); // Speed Of Fade Out