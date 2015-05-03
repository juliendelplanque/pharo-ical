rfc2445-tests
testeveryOtherDayForever
	| schedule generatedDates days end scheduleDuration |
	event addRecurrenceRule: self everyOtherDayForever.
	schedule := ICSchedule fromEvent: event.
	days := 20.
	scheduleDuration := self durationClass seconds: 86400 * days.
	end := event start + scheduleDuration.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: days / 2 + 1.
	self assert: (generatedDates last - generatedDates first) / days equals: scheduleDuration / days.
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
		assert: generatedDates fourth
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 8
				hour: 9
				minute: 0
				second: 0)