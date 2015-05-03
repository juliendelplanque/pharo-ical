rfc2445-tests
testeveryDayFor10
	| schedule dates generatedDates |
	event addRecurrenceRule: self everyDayFor10.
	schedule := ICSchedule fromEvent: event.
	dates := (0 to: 9) collect: [ :each | event start + (self durationClass days: each) ].
	generatedDates := schedule dates.
	generatedDates doWithIndex: [ :eachDate :index | self assert: eachDate equals: (dates at: index) ].
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
				year: 1997
				month: 9
				day: 11
				hour: 9
				minute: 0
				second: 0)