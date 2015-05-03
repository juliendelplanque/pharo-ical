as yet unclassified
testBetweenAndDoGivesErrorForInfiniteSchedule
	| rule |
	rule := ICRecurrenceRule fromICalString: 'FREQ=DAILY'.
	event addRecurrenceRule: rule.
	self should: [event schedule dates] raise: InfiniteScheduleLengthError