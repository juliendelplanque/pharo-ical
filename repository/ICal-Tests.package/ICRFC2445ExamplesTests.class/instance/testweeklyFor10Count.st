rfc2445-tests
testweeklyFor10Count
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self weeklyFor10Count.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: event start dayOfWeek ].
	self
		assert: generatedDates second
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 9
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 11
				day: 4
				hour: 9
				minute: 0
				second: 0)