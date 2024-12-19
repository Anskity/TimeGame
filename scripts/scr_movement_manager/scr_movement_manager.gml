function MovementManager(config={}) constructor {
	static update = function() {
		var motion = __.motion;
		with (__.inst) {
			var round_func = motion.x < 0 ? floor : ceil;
			
			var prev_motion_x = motion.x;
			var col_x = x+round_func(motion.x);
			if place_meeting(col_x, y, obj_solid) {
				var round_func = motion.x > 0 ? floor : ceil;
				x = round_func(x);
				
				var sign_x = sign(motion.x);
				while (!place_meeting(x+sign_x, y, obj_solid)) x += sign_x;
				motion.x = 0;
			}
			x += motion.x;
			motion.x = prev_motion_x;
			
			round_func = motion.y < 0 ? floor : ceil;
			if (place_meeting(x, y+round_func(motion.y), obj_solid)) {
				var round_func = motion.y > 0 ? floor : ceil;
				y = round_func(y);
				
				var sign_y = sign(motion.y);
				while (!place_meeting(x, y+sign_y, obj_solid)) y += sign_y;
				motion.y = 0;
			}
			y += motion.y;
		}
	}
	
	__ = {}
	with __ {
		inst = config.inst;
		motion = config.motion;
	}
}