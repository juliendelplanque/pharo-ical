testing
testDuration
	| duration |
	duration := self durationClass days: 15 hours: 5 minutes: 0 seconds: 20.
	self assert: 'P15DT5H0M20S'  = duration asICalString.
	
	duration := self durationClass weeks: 7.
	self assert: 'P7W'  = duration asICalString.