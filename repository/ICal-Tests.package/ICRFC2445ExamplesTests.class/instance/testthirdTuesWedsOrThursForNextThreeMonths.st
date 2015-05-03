rfc2445-tests
testthirdTuesWedsOrThursForNextThreeMonths
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self thirdTuesWedsOrThursForNextThreeMonths.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 3.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: (#(3 4 5) includes: eachDate dayOfWeek) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 4
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 11
				day: 6
				hour: 9
				minute: 0
				second: 0)