/// @desc Movement

switch (state) {
	
	case BOZI.IDLE: BOZI_IDLE(); break;
	
	case BOZI.FIRE: BOZI_FIRE(); break;
	
	case BOZI.DEAD: BOZI_DEAD(); break;
	
}

// Horizontal Movment
if (oPlayer.hsp != 0) && (instance_exists(oShip)) {
	
	// Move
	hsp = dir * hspWalk;
	
	// Ship
	oShip.x = oBozi.x + 2;
	
}

// Horizontal Collision
move_and_collide(hsp, 0, oPlayer, abs(hsp));

// Ship
if (!instance_exists(oShip)) {
	
instance_create_depth(x, y + 11, -999, oShip)

}

// Death 
if (hp == 0) {
	
	state = BOZI.DEAD;
	
}

// Countdown hurt timer
if (hurt_timer > 0) {
    hurt_timer -= 1;
}

// Sprites
if (hurt_timer > 0) {
    sprite_index = sBozimer_Hurt;
} 