testing
testUtcOffset
	| offset |
	offset := ICUtcOffset fromICalString: '-0500'.
	self deny: offset positive.
	self assert: offset hours = 5.
	self assert: offset minutes = 0.
	self assert: offset seconds = 0.
	self assert: '-0500'  = offset asICalString.
	
	offset := ICUtcOffset fromICalString: '+0100'.
	self assert: offset positive.
	self assert: offset hours = 1.
	self assert: offset minutes = 0.
	self assert: offset seconds = 0.
	self assert: '+0100'  = offset asICalString.
	
	offset := ICUtcOffset fromICalString: '+010005'.
	self assert: offset positive.
	self assert: offset hours = 1.
	self assert: offset minutes = 0.
	self assert: offset seconds = 5.
	self assert: '+010005'  = offset asICalString.
	
	offset := ICUtcOffset fromICalString: '-010005'.
	self deny: offset positive.
	self assert: offset hours = 1.
	self assert: offset minutes = 0.
	self assert: offset seconds = 5.
	self assert: '-010005'  = offset asICalString.