/// @desc Draw Menu

// Calcualte Background Dimensions

	// New Width
	var _new_w = 0;
	
	// Loop Through Options
	for (var i = 0; i < op_length; i++) {
		
		// Get String Width Of Each Option
		var _op_w = string_width(option[menu_level, i]);
		
		// Set New Width
		_new_w = max(_new_w, _op_w);
		
	}
	
	// Width
	width = _new_w + op_border * 2;
	
	// Height
	height = op_border * 2 + string_height(option[0, 0]) + (op_length - 1) * op_space;
	
// Position Background To Center

	// X
	x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - width / 1.85; // 2
	
	// Y
	y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - height / 4; // 2	

// Set Alpha
draw_set_alpha(alpha);

// Draw Background
draw_rectangle_color(0, 2000, 4000, -10, c_red, c_red, c_maroon, c_red, false);

// Check Alpha
if (alpha == 0.75) {

	// Set Alpha
	draw_set_alpha(1);

	// Draw Box
	draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height / sprite_height, 0, c_white, 0.95);

	// Draw Text

		// Set Font
		draw_set_font(global.font_main);
	
		// Align Text
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
	
		// Loop Through Options
		for (var i = 0; i < op_length; i++) {
		
			// Set Default Color Var.
			var _c = c_black;		
		
			// Set Selection Color
			if pos ==  i { _c = c_red };
		
			// Draw Text
			draw_text_color(x + op_border, y + op_border + op_space * i, option[menu_level, i], _c, _c, _c, _c, 1);
		
		}
		
	}
