rfc2445-tests
testmonthyFirstAndLastSundayFor10
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self monthyFirstAndLastSundayFor10.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: 1 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 7
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 5
				day: 31
				hour: 9
				minute: 0
				second: 0)