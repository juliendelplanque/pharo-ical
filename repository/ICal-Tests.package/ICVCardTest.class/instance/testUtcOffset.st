testing-parsing
testUtcOffset
	| offset |
	offset := ICUtcOffset fromVCardString: '-05:00'.
	self deny: offset positive.
	self assert: offset hours = 5.
	self assert: offset minutes = 0.
	self assert: offset seconds = 0.
	self assert: '-05:00'  = offset asVCardString.

	offset := ICUtcOffset fromVCardString: '+01:00'.
	self assert: offset positive.
	self assert: offset hours = 1.
	self assert: offset minutes = 0.
	self assert: offset seconds = 0.
	self assert: '+01:00'  = offset asVCardString.
	
	offset := ICUtcOffset fromVCardString: '+01:05'.
	self assert: offset positive.
	self assert: offset hours = 1.
	self assert: offset minutes = 5.
	self assert: offset seconds = 0.
	self assert: '+01:05'  = offset asVCardString.
	
	offset := ICUtcOffset fromVCardString: '-01:05'.
	self deny: offset positive.
	self assert: offset hours = 1.
	self assert: offset minutes = 5.
	self assert: offset seconds = 0.
	self assert: '-01:05'  = offset asVCardString.