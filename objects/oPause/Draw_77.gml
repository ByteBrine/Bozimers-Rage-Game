/// @descr Freeze The Action

// Diable Alpha Blending 9RGB)
gpu_set_blendenable(false);

// Draw Frozen Image To Screen Whilst Paused
if (pause) {
	
	surface_set_target(application_surface);
	if (surface_exists(pauseSurf)) draw_surface(pauseSurf, 0, 0);
	else { // Restore From Buffer If We Lost The Surface
		
		pauseSurf = surface_create(resW, resH);
		buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
	}
	
	surface_reset_target();
	
}

// Toggle Pause 
if (keyboard_check_pressed(vk_escape)) && (room != rMenu) || (!pause) && (os_is_paused()) && (room != rMenu) {
	
	if (!pause) { // Pasue Now
		
		pause = true;
		
		// Deactivate Everything
		instance_deactivate_all(true);
		
		// Activate Certain Instances
		instance_activate_object(oInit);
		instance_activate_object(oHud);
		instance_activate_object(oCamera);
		
		// Freeze Player
		global.playerInit = false;
		
		// Capture This Moment (Non GUI)
		pauseSurf = surface_create(resW, resH);
		surface_set_target(pauseSurf);
			draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		// Backup This Surface To a Buffer Incase We Lose It.
		if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
		pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
		buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
			
	}
	else { // Unpause now
		
		// Toggle
		pause = false;
		
		// Freeze Player
		global.playerInit = true;	
		
		// Reactivate Everything
		instance_activate_all();
		
		// Free Surface
		if (surface_exists(pauseSurf)) surface_free(pauseSurf);
		if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
		
	}
}

// Enable Blendable
gpu_set_blendenable(true);
