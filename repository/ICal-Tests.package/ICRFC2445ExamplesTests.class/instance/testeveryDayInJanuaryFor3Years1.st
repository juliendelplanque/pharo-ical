rfc2445-tests
testeveryDayInJanuaryFor3Years1
	| schedule generatedDates days end |
	event addRecurrenceRule: self everyDayInJanuaryFor3Years1.
	schedule := ICSchedule fromEvent: event.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: 93.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate month equals: 1.
			self assert: eachDate year < 2007 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 1
				day: 1
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 2000
				month: 1
				day: 31
				hour: 9
				minute: 0
				second: 0)