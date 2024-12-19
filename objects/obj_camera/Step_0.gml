if !instance_exists(inst) {
	instance_destroy();
	exit;
}

var inst_x = inst.x - global.camera_w/2;
var inst_y = inst.y - global.camera_h/2 - sprite_get_height(spr_character)/2;

var margin = global.camera_w*.2;

var target_x = clamp(global.camera_x, inst_x - margin/2, inst_x + margin/2);
var target_y = clamp(global.camera_y, inst_y  - margin/2, inst_y + margin/2);

target_x = clamp(target_x, 0, room_width-global.camera_w);
target_y = clamp(target_y, 0, room_height-global.camera_h);

global.camera_x = lerp(global.camera_x, target_x, .3);
global.camera_y = lerp(global.camera_y, target_y, .3);
