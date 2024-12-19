function highest() {
	var n = 0;
	
	for (var i = 0; i < argument_count; ++i) {
		if abs(argument[i]) > abs(n) {
			n = argument[i];
		}
	}
	
	return n;
}
