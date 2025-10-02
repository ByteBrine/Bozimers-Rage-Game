// Init
hsp = 0; 
vsp = 0; 
dir = 1;

// Values
hspWalk = 2; 
vspJump = -4; 

// Health
hp = 6;
hp_max = hp;

// Bar
healthbar_width = 100;
healthbar_height = 12;
healthbar_x = (display_get_gui_width() / 2) - (healthbar_width / 2);
healthbar_y = ystart - 20;

// Timer
timer = 180;
hurt_timer = 0;

// States
state = BOZI.IDLE;
enum BOZI {
	
	IDLE,
	FIRE,
	DEAD
	
}