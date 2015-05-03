rfc2445-tests
testweeklyUntilDec24
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self weeklyUntilDec24.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: 17.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: event start dayOfWeek ].
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
				month: 12
				day: 23
				hour: 9
				minute: 0
				second: 0)