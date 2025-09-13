/// @descr Steam Stats

// Update
steam_update();

// Load Stats
if steam_stats_ready() {
	
	// ANY%
	global.current_stage = steam_get_stat_int("stage_comp");
	
	// 100%
	
	// DEATHS%
	

}

// Send Stats
if (global.send_steam_stats == true) {
	
	// ANY%
	steam_set_stat_int("stage_comp", global.current_stage);
	
	// 100%
	
	// DEATHS%	
	
}