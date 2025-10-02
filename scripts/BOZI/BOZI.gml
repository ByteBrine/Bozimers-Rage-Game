function BOZI_IDLE() {
	
	// Sprite
	sprite_index = sBozimer;
	
	// Health Check
	if (hp <= 3) {
	
		// Countdown
		if (timer != 0) {
		
			// Decrease Timer
			timer -= 1;
		
		} else {
		
			// Choose Attack
			state = BOZI.FIRE;
		
		}
		
	}
	
}

function BOZI_FIRE() {
	
	// Sprite
	sprite_index = sBozimer_Fire;
	
	// Spawn Bullet
	instance_create_depth(x, y, -999, oSawdrop);
	
	// Sfx
	oAudio.blastSnd = true;
	
	// State
	state = BOZI.IDLE;
	
	// Reset Timer
	timer = 180;
	
}

function BOZI_DEAD() {
	
	// Sprites
	sprite_index = sBozimer_Dead;
	oShip.sprite_index = sShip_Dead;
	
	// State
	oPlayer.state = PLAYER.FINISH;
	
	// Destroy
	instance_destroy();
	instance_destroy(oShip);
	
}