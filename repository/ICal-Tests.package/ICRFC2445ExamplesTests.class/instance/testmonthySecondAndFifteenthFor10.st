rfc2445-tests
testmonthySecondAndFifteenthFor10
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self monthySecondAndFifteenthFor10.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: (#(2 15) includes: eachDate dayOfMonth) ].
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
				year: 1998
				month: 1
				day: 15
				hour: 9
				minute: 0
				second: 0)