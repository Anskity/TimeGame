function CharacterController(config={}) constructor {
	static update = function() {
		var __ = self.__;
		var left = keyboard_check(vk_left) || keyboard_check(ord("A"));
		var right= keyboard_check(vk_right) || keyboard_check(ord("D"));
		var key_dir = -left+right;
		
		if key_dir == 0 {
			__.motion.x = lerp(__.motion.x, 0, __.fric);
		} else {
			__.motion.x = lerp(__.motion.x, key_dir*__.spd, __.acel);
		}
		
		var box = noone;
		
		with __.inst {
			box = instance_place(x + key_dir*__.spd, y, obj_box);
		}
		
		if instance_exists(box) {
			if key_dir > 0 {
				if __.inst.x < box.x {
					__.inst.x = box.bbox_left - abs(__.inst.x-__.inst.bbox_right);
				}
			} else {
				if __.inst.x > box.x {
					__.inst.x = box.bbox_right + abs(__.inst.x-__.inst.bbox_left);
				}
			}
			
			box.motion.x = __.spd * key_dir * .5;
		}
		
		var on_ground = true;
		with __.inst {
			on_ground = place_meeting(x, y+1, obj_solid);
		}
		
		if keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_space) {
			__.jump_key.is_pressed = true;
		}
		
		if __.jump_key.is_pressed {
			__.jump_key.timer.tick({jump_key: __.jump_key});
		}
		
		if on_ground {
			if __.jump_key.is_pressed {
				__.jump_key.is_pressed = false;
				__.motion.y = -__.jump_pow;
			}
		} else {
			__.motion.y += __.grav;
		}
	}
	
	__ = {};
	with __ {
		inst = config.inst;
		motion = config.motion;
		spd = config[$ "spd"] ?? 1;
		acel = config[$ "acel"] ?? .2;
		fric = config[$ "fric"] ?? .3;
		jump_pow = config[$ "jump_pow"] ?? 2.5;
		grav = config[$ "grav"] ?? .1;
		
		jump_key = {
			is_pressed: false,
			timer: new Timer(.2, function(args) {
				args.jump_key.is_pressed = false;
			}),
		}
	}
}