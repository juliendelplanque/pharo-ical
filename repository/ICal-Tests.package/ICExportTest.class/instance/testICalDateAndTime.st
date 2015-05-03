testing
testICalDateAndTime
	self 
		assert: event start asICalString = '20050425T104500'.
	self 
		assert: event end asICalString = '20050425T120900'