/// @desc Load Settings

// Set Default Shader
horrifi_enable(false);
horrifi_bloom_set(false, 0, 0, 0);
horrifi_chromaticab_set(true,0.128);
horrifi_scanlines_set(true,0.10);
horrifi_vhs_set(true,0.10);
horrifi_vignette_set(true,0.15,0.43);
horrifi_crt_set(true, 8);
horrifi_noise_set(true,0.10);


// load game
LoadGame();

// Set Settings
window_set_fullscreen(global.fullscreen);
horrifi_enable(global.filter);





