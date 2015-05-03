testing
testTrigger
	| trigger |
	trigger := ICTrigger fromICalString: 'PT5M ' parameters: (Dictionary with: 'RELATED' -> 'END').
	
	self assert: trigger isRelatedToEnd.
	self assert: trigger value = (self durationClass days: 0 hours: 0 minutes: 5 seconds: 0).
	self assert: trigger asICalString = 'PT0H5M0S'.
	
	self assert: ICTrigger new isRelatedToStart.
	
	trigger := ICTrigger
		fromICalString: '19501122T223344 '
		parameters: (Dictionary with: 'RELATED' -> 'END' with: 'VALUE' -> self dateAndTimeClass iCalType).
	self assert: trigger value = (self dateAndTimeClass year: 1950 month: 11 day: 22 hour: 22 minute: 33 second: 44).