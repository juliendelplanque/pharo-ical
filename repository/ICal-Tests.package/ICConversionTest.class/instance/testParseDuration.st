testing
testParseDuration
	| duration string |
	string := 'P15DT5H0M20S'.
	duration := self durationClass fromICalString: string.
	self assert: string  = duration asICalString.
	self assert: duration = (self durationClass days: 15 hours: 5 minutes: 0 seconds: 20).
	
	string := '-P15DT5H0M20S'.
	duration := self durationClass fromICalString: string.
	self assert: string  = duration asICalString.
	self assert: duration = (self durationClass days: 15 hours: 5 minutes: 0 seconds: 20) negated.
	
	string := 'P7W'.
	duration := self durationClass fromICalString: string.
	self assert: string  = duration asICalString.
	self assert: duration = (self durationClass weeks: 7).
	
	string := '-P7W'.
	duration := self durationClass fromICalString: string.
	self assert: string  = duration asICalString.
	self assert: duration = (self durationClass weeks: 7 negated).
	self assert: duration = (self durationClass weeks: 7) negated.
	
	string := 'PT5M'.
	duration := self durationClass fromICalString: string.
	self assert: 'PT0H5M0S'  = duration asICalString.
	self assert: duration = (self durationClass days: 0 hours: 0 minutes: 5 seconds: 0).
	
	string := '-PT5M'.
	duration := self durationClass fromICalString: string.
	self assert: '-PT0H5M0S'  = duration asICalString.
	self assert: duration = (self durationClass days: 0 hours: 0 minutes: 5 seconds: 0) negated.
	self assert: duration = (self durationClass days: 0 hours: 0 minutes: 5 negated seconds: 0).
	
	self assert: (self durationClass fromICalString: 'PT0H5M0S') = (self durationClass fromICalString: 'PT5M').