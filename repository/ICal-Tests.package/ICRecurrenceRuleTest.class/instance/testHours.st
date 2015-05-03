testing
testHours
	| rule expected firstOption secondOption actual |
	rule := ICRecurrenceRule frequency: 'MONTHLY'.
	
	rule addHour: 5.	
	expected := 'FREQ=MONTHLY;BYHOUR=5'.
	self assert: expected = rule asICalString.
	
	rule addHour: 15.	
	firstOption := 'FREQ=MONTHLY;BYHOUR=15,5'.
	secondOption := 'FREQ=MONTHLY;BYHOUR=5,15'.
	actual := rule asICalString.
	self assert: ((Array with: firstOption with: secondOption) includes: actual).
	