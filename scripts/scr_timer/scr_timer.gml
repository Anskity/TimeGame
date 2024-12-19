function Timer(_time_max, _callback) constructor {
	static tick = function(args={}) {
		time_current++;
		
		if time_current > time_max*60 {
			callback(args);
			time_current = 0;
		}
	}
	
	static reset = function() {
		time_current = 0;
	}

	time_current = 0;
	time_max = _time_max;
	callback = _callback;
}
