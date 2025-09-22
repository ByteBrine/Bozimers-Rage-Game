function PLAYER_RUN() {
    #region Movement & Jump
    hsp = dir * hspWalk; vsp += grv;
	
    if ((canJump-- > 0) && (jumpBuffer > 0)) {
		
        vsp = vspJump; 
		canJump = 0; 
		jumpBuffer = 0; 
		oAudio.jumpSnd = true;
		
    }
    #endregion
    
    #region Collectibles
    if (place_meeting(x, y, oRing)) { 
		
		canDash = true; 
		ScreenShake(1, 5); 
		
		}
		
    if (!instance_exists(oShard)) shard_collected = true;
    #endregion

    #region Dash
    if (canDash) {
		
		// Disable Dash & Jump
        canDash = false; canJump = 0;
		
		// Direction
        dashDirection = point_direction(0,0,dir,0);
		
		// Distance
        dashSp = dashDistance / dashTime; dashEnergy = dashDistance;
		
		// Sound
        oAudio.ringSnd = true; state = PLAYER.DASH;
		
    }
    #endregion

    #region Collisions & Hazards
    onGround = place_meeting(x, y + 1, oWall);
	
	// Collision
    PLAYER_COLLIDE();
	
	// Hazards
    if (place_meeting(x, y, pHazard)) state = PLAYER.DEAD;
	
	// Running Sprites
    sprite_index = (vsp < 0) ? sPlayerJump : sPlayer;
    #endregion
}

function PLAYER_DASH() {
    #region Dash
	
	// Sprite
    if (sprite_index != sPlayerDash) sprite_index = sPlayerDash;
	
	// Direction
    hsp = lengthdir_x(dashSp, dashDirection);
    vsp = lengthdir_y(dashSp, dashDirection);
	
	// Trail
    with (instance_create_depth(x, y, depth + 1, oTrail)) { sprite_index = sPlayerDashMask; image_alpha = 0.2; }
	
	// Collision
    PLAYER_COLLIDE();
	
	// Time
    dashEnergy -= dashSp;
	
	// State
    if (dashEnergy <= 0) { hsp = 0; vsp = 0; sprite_index = sPlayer; state = PLAYER.RUN; }
	
    #endregion
}

function PLAYER_DEAD() {
    #region Death
	
	// Sprite
    hsp = 0; mask_index = noone; sprite_index = sPlayerDead;
	
	// Jump Effect
    if (!deathJumped) { vsp = vspJump; deathJumped = true; oAudio.deathSnd = true; ScreenShake(2,10); }
    vsp += grv; y += vsp; image_angle += 5;
	
	// Restart Stage
    if (y > room_height + 50 && !global.midTransition) { room_restart(); }
	
	// Destroy Hud
	instance_destroy(oHud);
	
    #endregion
}

function PLAYER_FINISH() {
    #region Finish
	
	// Destroy Hud
	instance_destroy(oHud);	
	
	// Freeze Player
    hsp = 0; vsp += grv; onGround = place_meeting(x,y+1,oWall); PLAYER_COLLIDE();
    sprite_index = (vsp < 0) ? sPlayerJump : sPlayerIdle;
	
	// Place Menu
	if (!instance_exists(oResults)) && (!global.midTransition) {
		
		// Draw Menu
		instance_create_depth(x, y, -999, oResults);
		
	}
	
    #endregion
}

function PLAYER_COLLIDE() {
    #region Collision
	
	// Horizontal
    move_and_collide(hsp, 0, oWall, abs(hsp));
	
	// Horizontal Check
	if (place_meeting(x + hsp, y, oWall)) state = PLAYER.DEAD;
	
	// Vertical
    var _vCol = move_and_collide(0, vsp, oWall, abs(vsp) + 1, hsp, vsp, hsp, vsp);
    if (array_length(_vCol) > 0) { if (vsp > 0) canJump = 10; vsp = 0; }
    #endregion
}
