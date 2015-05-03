parsing
parse	
	[ self stream atEnd ]
		whileFalse: [ self parseLine ]