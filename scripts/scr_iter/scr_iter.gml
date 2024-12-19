#macro ITERATOR_USE_MAP map = f(callback){r new MapIterator(self, callback) }
#macro ITERATOR_USE_FILTER filter = f(callback){r new FilterIterator(self, callback) }
#macro ITERATOR_USE_COLLECT collect = f() { var arr = []; while true { var value = next(); if is_undefined(value) return arr; array_push(arr, value); } }
#macro ITERATOR_USE_ANY any = f(callback) { while true { var value = next(); if is_undefined(value) return false; if callback(value) return true; } } 
#macro ITERATOR_USE_ALL all_ = f(callback) { while true { var value = next(); if is_undefined(value) return true; if !callback(value) return false; } } 
#macro ITERATOR_FIND_FIRST find_first = f(callback) {while true { var i = 0; var value = next(); if is_undefined(value) return undefined; if callback(value) return i; i++} }

function ArrayIterator(_arr) constructor {
	idx = 0;
	arr = _arr;
	
	static next = function() {
		if idx >= array_length(arr) {
			return undefined;
		}
		return arr[idx++];
	}
	
	ITERATOR_USE_MAP
	ITERATOR_USE_FILTER
	ITERATOR_USE_COLLECT
	ITERATOR_USE_ANY
	ITERATOR_USE_ALL
	ITERATOR_FIND_FIRST
}
function DsListIterator(_list) constructor {
	idx = 0;
	list = _list;
	
	static next = function() {
		if idx >= ds_list_size(list) {
			return undefined;
		}
		return list[|idx++];
	}
	
	static reset = function() {
		idx = 0;
	}
	
	ITERATOR_USE_MAP
	ITERATOR_USE_FILTER
	ITERATOR_USE_COLLECT
	ITERATOR_USE_ANY
	ITERATOR_USE_ALL
	ITERATOR_FIND_FIRST
}

function MapIterator(_iter, _callback) constructor {
	idx = 0;
	iter = _iter;
	callback = _callback;
	
	static next = function() {
		var value = iter.next();
		
		if is_undefined(value) {
			return undefined;
		} else {
			return callback(value, idx++);
		}
	}
	
	ITERATOR_USE_MAP
	ITERATOR_USE_FILTER
	ITERATOR_USE_COLLECT
	ITERATOR_USE_ANY
	ITERATOR_USE_ALL
	ITERATOR_FIND_FIRST
}

function FilterIterator(_iter, _callback) constructor {
	idx = 0;
	iter = _iter;
	callback = _callback;
	
	static next = function() {
		var value = iter.next();
		
		if is_undefined(value) {
			return undefined;
		}
		
		if !callback(value, idx) {
			idx += 1;
			return next();
		}
		idx += 1;
		
		return value;
	}
	
	ITERATOR_USE_MAP
	ITERATOR_USE_FILTER
	ITERATOR_USE_COLLECT
	ITERATOR_USE_ANY
	ITERATOR_USE_ALL
	ITERATOR_FIND_FIRST
}

#macro f function
#macro r return
 
//even_numbs_to_hundred = new ArrayIterator(array_create(100, 0))
//							.map(f(_, i){r i})
//							.filter(f(n){r (n&1) == 0})
//							.collect();
