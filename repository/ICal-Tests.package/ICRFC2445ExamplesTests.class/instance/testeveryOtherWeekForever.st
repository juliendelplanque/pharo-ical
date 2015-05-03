rfc2445-tests
testeveryOtherWeekForever
	| schedule generatedDates weeks end scheduleDuration |
	event addRecurrenceRule: self everyOtherWeekForever.
	schedule := ICSchedule fromEvent: event.
	weeks := 21.
	scheduleDuration := self durationClass seconds: 86400 * 7 * weeks.
	end := event start + scheduleDuration.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: (weeks +1 / 2)   .

	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 1
				day: 20
				hour: 9
				minute: 0
				second: 0)