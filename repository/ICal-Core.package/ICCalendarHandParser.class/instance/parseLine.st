parsing
parseLine
	self parseName.
	
	self parseParameters.
	self parseValue.
	
	self contentline