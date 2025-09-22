/// @desc Movement

// Horizontal
if (oPlayer.hsp != 0) {
	
	hsp = dir * hspWalk; vsp += grv;
	
}

// Horizontal Collision
move_and_collide(hsp, 0, oWall, abs(hsp));
