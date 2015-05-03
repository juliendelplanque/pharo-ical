as yet unclassified
testGetScheduleFromEvent
	| rule |
	rule := ICRecurrenceRule fromICalString: 'FREQ=DAILY;COUNT=10'.
	event addRecurrenceRule: rule.
	self assert: event schedule dates size equals: 10