/// @descr Do Movement

// Movement
if (oPlayer.hsp != 0) {
	
	// If hori...
	if (hori == true) {
		
		hsp = moveSpd * horiDir;
		x += hsp;
		
	} else hsp = 0;
	
		// Collision
		if place_meeting(x + hsp, y, oWall) horiDir = -horiDir;

	// If verti...
	if (verti == true) {
		
		vsp = moveSpd * vertiDir;
		y += vsp;
		
	} else vsp = 0;	
	
		// Collision
		if place_meeting(x, y + vsp, oWall) vertiDir = -vertiDir;
	
}
		
	