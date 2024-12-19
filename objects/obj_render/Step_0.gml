if !surface_exists(light_surf) {
	light_surf = surface_create(global.camera_w, global.camera_h);
}

surface_set_target(light_surf);
	draw_clear_alpha(c_black,0);
	
	idx = 0;
	
	var draw_light_on = self.draw_light_on;

	with obj_character {
		draw_light_on(x, y-sprite_height/2, 5);
		draw_light_on(x, y-sprite_height/2, 7);
	}
	
	idx = 0;
surface_reset_target();