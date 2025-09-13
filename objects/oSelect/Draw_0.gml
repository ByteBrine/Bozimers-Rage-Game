/// @desc Draw Menu

#region Calculate Background Dimensions
var _new_w = 0;
for (var i = 0; i < op_length; i++) {
    var _op_w = string_width(option[menu_level, i]);
    _new_w = max(_new_w, _op_w);
}
width  = _new_w + op_border * 2;
height = op_border * 2 + string_height(option[0, 0]) + (op_length - 1) * op_space;
#endregion

#region Position Background
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - width / 1.85;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - height / 4;
#endregion

#region Draw Background
draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height / sprite_height, 0, c_white, 0.95);
#endregion

#region Draw Text + Icons
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i = 0; i < op_length; i++) {
    var _c = (pos == i) ? c_red : c_black;
    var _tx = x + op_border;
    var _ty = y + op_border + op_space * i;

    // Draw option text
    draw_text_color(_tx, _ty, option[menu_level, i], _c, _c, _c, _c, 1);

    // Stage Icons 
	if (menu_level != 0)  {

		var stages_per_world = 5; // change to your design
		var stage_index = (menu_level - 1) * stages_per_world + i;
        var icon_x = _tx + _new_w + 16; // offset right of text

	if (menu_level != 0) {
	    var stage_index = (menu_level - 1) * stages_per_world + i; // or use offsets

	    var icon_x = _tx + _new_w + 16;

	    if (global.level_complete[stage_index]) draw_sprite(sComplete, 0, icon_x, _ty + 5);
	    if (global.level_shard[stage_index]) draw_sprite(sCollect, 0, icon_x + 10, _ty + 5);
		
		}
		
    }
	
}
#endregion
