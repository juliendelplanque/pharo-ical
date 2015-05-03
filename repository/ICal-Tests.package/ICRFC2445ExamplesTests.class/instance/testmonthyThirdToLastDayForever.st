rfc2445-tests
testmonthyThirdToLastDayForever
	| schedule generatedDates months end scheduleDuration |
	event addRecurrenceRule: self monthyThirdToLastDayForever.
	schedule := ICSchedule fromEvent: event.
		end := self dateAndTimeClass
		year: 1998
		month: 3
		day: 1
		hour: 9
		minute: 0
		second: 0.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 6.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfMonth equals: eachDate daysInMonth - 2 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 28
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 2
				day: 26
				hour: 9
				minute: 0
				second: 0)