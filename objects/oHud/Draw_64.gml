/// @desc Draw Hud Data

#region Stage Text

// Font
draw_set_font(fHud);

// Color
var _c = c_black	

// Align Text
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Stage
with (oPause) {
	
	if (!pause) && (!instance_exists(oDialogParent)) {
	
	// Draw Stage Text
	draw_text_color(20, 10, room_get_name(room), _c, _c, _c, _c, 0.9);
	
	} else if (!instance_exists(oDialogParent)) {
	
	// Draw Pause Text
	draw_text_color(20, 10, "Paused", _c, _c, _c, _c, 0.95);
	
	// Set Smaller Font
	draw_set_font(fHud_sm);
	
	// Draw Option Text
	draw_text_color(20, 50, "[R] Restart", _c, _c, _c, _c, 0.95);	
	
	}
	
}

#endregion