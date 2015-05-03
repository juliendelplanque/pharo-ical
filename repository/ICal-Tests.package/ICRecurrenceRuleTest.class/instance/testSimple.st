testing
testSimple
	| rule |
	rule := ICRecurrenceRule frequency: 'MONTHLY'.
	self assert: 'FREQ=MONTHLY' = rule asICalString