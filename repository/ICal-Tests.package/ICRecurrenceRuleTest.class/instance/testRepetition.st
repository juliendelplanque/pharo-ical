testing
testRepetition
	| rule expected |
	rule := ICRecurrenceRule frequency: 'MONTHLY'.
	
	rule count: 4.	
	expected := 'FREQ=MONTHLY;COUNT=4'.
	self assert: expected = rule asICalString.
	
	rule until: (self dateClass year: 1997 month: 3 day: 10).
	expected := 'FREQ=MONTHLY;UNTIL=19970310'.
	self assert: expected = rule asICalString.
	
	rule count: 2.
	expected := 'FREQ=MONTHLY;COUNT=2'.
	self assert: expected = rule asICalString.