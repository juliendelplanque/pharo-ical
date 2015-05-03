rfc2445-tests
testevery18MonthsOnThe10thThrough15thFor10
	| schedule generatedDates |
	event addRecurrenceRule: self every18MonthsOnThe10thThrough15thFor10.
	schedule := ICSchedule fromEvent: event.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: 10.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate dayOfMonth < 16.
			self assert: eachDate dayOfMonth > 9 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 10
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1999
				month: 3
				day: 13
				hour: 9
				minute: 0
				second: 0)