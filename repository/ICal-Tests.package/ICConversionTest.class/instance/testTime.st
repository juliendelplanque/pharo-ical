testing
testTime
	| time |
	time := self timeClass hour: 22 minute: 33 second: 44.
	self assert: '223344'  = time asICalString.
	
	time := self timeClass hour: 0 minute: 0 second: 0.
	self assert: '000000'  = time asICalString.
	
	time := self timeClass hour: 1 minute: 2 second: 3.
	self assert: '010203'  = time asICalString.