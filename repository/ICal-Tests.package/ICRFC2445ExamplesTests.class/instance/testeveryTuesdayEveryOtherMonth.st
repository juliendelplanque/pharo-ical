rfc2445-tests
testeveryTuesdayEveryOtherMonth
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self everyTuesdayEveryOtherMonth.
	schedule := ICSchedule fromEvent: event.
	years := 7 / 12.
	scheduleDuration := self durationClass seconds: 86400 * years * 365.
	end := event start + scheduleDuration.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 18.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: 3 ].
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
				month: 3
				day: 31
				hour: 9
				minute: 0
				second: 0)