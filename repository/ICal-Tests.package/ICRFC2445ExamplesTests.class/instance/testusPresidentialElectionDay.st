rfc2445-tests
testusPresidentialElectionDay
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self usPresidentialElectionDay.
	schedule := ICSchedule fromEvent: event.
	years := 9.
	scheduleDuration := self durationClass seconds: 86400 * years * 366.
	end := event start + scheduleDuration.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: years // 4 + 1.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: 3 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1996
				month: 11
				day: 5
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 2004
				month: 11
				day: 2
				hour: 9
				minute: 0
				second: 0)