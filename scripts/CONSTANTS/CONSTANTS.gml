// Macros

// Globals
global.current_stage = 0;
global.filter = 0;
global.font_main = fMain;
global.freeplay = false;
global.fullscreen = 0;
global.level_count = 25;
global.MASTER_VOL = 1;
global.midTransition = false;
global.MUS_VOL = 1;
global.playerInit = false;
global.roomTarget = -1;
global.send_steam_stats = false;
global.SFX_VOL = 1;
global.shard_count = 0;

// Arrays
global.level_complete = array_create(global.level_count, 0);
global.level_shard = array_create(global.level_count, 0);


// Enums
enum PLAYER {
	
	INIT,
	RUN,
	DASH,
	DEAD,
	FINISH
	
}