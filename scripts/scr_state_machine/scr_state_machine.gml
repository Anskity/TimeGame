function State(config = {}) constructor {
	update = config[$ "update"] ?? function(){}
}

function StateMachine(config = {}) constructor {
	static update = function(_self, args) {
		__.state_map[? __.current_state].update(_self, args);
	}
	
	__ = {};
	with __ {
		state_map = config.state_map;
		current_state = config[$ "init_state"] ?? 0;
	}
}