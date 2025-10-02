var inPlayableRoom = (room != rMenu && room != rSelect);

// Toggle pause by ESC or system pause
if ((keyboard_check_pressed(vk_escape) && inPlayableRoom) 
 || (!pause && os_is_paused() && inPlayableRoom)) && (!instance_exists(oResults)) {
    
    if (!pause) {
        // --- Pause ---
        pause = true;
        instance_deactivate_all(true);
        instance_activate_object(oInit);
        instance_activate_object(oHud);
        instance_activate_object(oCamera);

        global.playerInit = false;

        // Capture freeze-frame
        if (surface_exists(pauseSurf)) surface_free(pauseSurf);
        pauseSurf = surface_create(resW, resH);
        surface_set_target(pauseSurf);
            draw_surface(application_surface, 0, 0);
        surface_reset_target();

        if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
        pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
        buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
    }
    else {
        // --- Unpause ---
        pause = false;
        global.playerInit = true;
        instance_activate_all();

        if (surface_exists(pauseSurf)) surface_free(pauseSurf);
        if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
    }
}
