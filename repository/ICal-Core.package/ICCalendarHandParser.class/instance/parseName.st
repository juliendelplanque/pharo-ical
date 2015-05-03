parsing
parseName
	self name: 
		(self unfold: 
			(self stream upToAny: #($; $:)) asUppercase).
	self stream position: self stream position - 1.