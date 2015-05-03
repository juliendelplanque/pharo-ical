testing
testBoolean
	self assert: 'TRUE'  = true asICalString.
	self assert: 'FALSE'  = false asICalString.