/// @desc Draw Health Bar

// Set Alpha
draw_set_alpha(0.50);

// Draw Background
draw_sprite(sHealthbar_back, 0, healthbar_x, healthbar_y);

// Draw Healthbar
draw_sprite_stretched(sHealthbar, 0, healthbar_x, healthbar_y, (hp / hp_max) * healthbar_width, healthbar_height);

// Draw Boarder
draw_sprite(sHealthbar_boarder, 0, healthbar_x, healthbar_y);

// Set Alpha
draw_set_alpha(1);