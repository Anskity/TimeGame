var tex = surface_get_texture(light_surf);

shader_set(shd_light);

var u_light_surf = shader_get_sampler_index(shd_light, "light_surf");
texture_set_stage(u_light_surf, tex);

draw_surface(application_surface, 0, 0);

shader_reset();
