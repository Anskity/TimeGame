light_surf = -1;
application_surface_draw_enable(false);

lights_x = array_create(100, 0);
lights_y = array_create(100, 0);
lights_intensity = array_create(100, 0);
lights_color = array_create(100, 0);
idx = 0;

draw_light_on = function(pos_x, pos_y, intensity=1, color=c_white) {
	lights_x[idx] = pos_x;
	lights_y[idx] = pos_y;
	lights_intensity[idx] = intensity;
	lights_color[idx] = color;
}
