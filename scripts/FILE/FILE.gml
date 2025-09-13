function SaveGame() {
	
	// Check If File Exists
	if (file_exists("SaveFile.rg")) {
		
		// Delete File
		file_delete("SaveFile.rg");	
		
	}
	
	// Create New File
	ini_open("SaveFile.rg");
	
	// Write To File
	
		// Progress
		ini_write_real("Progress", "Current_Stage", global.current_stage);
		ini_write_real("Progress", "Shard_Count", global.shard_count);
		
		// Per Level Progess
		
			// Loop Through Levels
			for (var i = 0; i < global.level_count; i++) {
				
				var _section = "Level_" + string(i);
				
				ini_write_real(_section, "Complete", global.level_complete[i]);
				ini_write_real(_section, "Shard", global.level_shard[i]);
				
			}
	
		// Settings
		ini_write_real("Settings", "Fullscreen", global.fullscreen);
		ini_write_real("Settings", "Filter", global.filter);
		ini_write_real("Settings", "Master", global.MASTER_VOL);
		ini_write_real("Settings", "Music", global.MUS_VOL);
		ini_write_real("Settings", "Sound", global.SFX_VOL);
	
	// Close File
	ini_close();
}

function LoadGame() {
    // Check if save exists
    if (file_exists("SaveFile.rg")) {
        ini_open("SaveFile.rg");

        #region Progress
        global.current_stage = ini_read_real("Progress", "Current_Stage", 0);
        global.shard_count   = ini_read_real("Progress", "Shard_Count", 0);

        // Load each level's saved properties
        for (var i = 0; i < global.level_count; i++) {
            var section = "Level_" + string(i);

            global.level_complete[i] = ini_read_real(section, "Complete", 0);
            global.level_shard[i]    = ini_read_real(section, "Shard", 0);
        }
        #endregion

        #region Settings
        global.fullscreen  = ini_read_real("Settings", "Fullscreen", false);
        global.filter      = ini_read_real("Settings", "Filter", false);
        global.MASTER_VOL  = ini_read_real("Settings", "Master", 1);
        global.MUS_VOL     = ini_read_real("Settings", "Music", 1);
        global.SFX_VOL     = ini_read_real("Settings", "Sound", 1);
        #endregion

        ini_close();
    } 
    else {
        // No save file — initialize defaults
        global.current_stage = 0;
        global.shard_count   = 0;
        global.level_complete = array_create(global.level_count, 0);
        global.level_shard    = array_create(global.level_count, 0);
    }
}
