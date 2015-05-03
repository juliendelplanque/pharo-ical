rfc2445-tests
testsecondToLastWeekday
	| schedule generatedDates months end scheduleDuration |
	event addRecurrenceRule: self secondToLastWeekday.
	schedule := ICSchedule fromEvent: event.
	end := self dateAndTimeClass
		year: 1998
		month: 4
		day: 1
		hour: 9
		minute: 0
		second: 0.
	generatedDates := schedule datesBetween: event start and: end.
	generatedDates do: [ :eachDate | self assert: (#(2 3 4 5 6) includes: eachDate dayOfWeek) ].
	self assert: generatedDates size equals: 7.
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 29
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 3
				day: 30
				hour: 9
				minute: 0
				second: 0)