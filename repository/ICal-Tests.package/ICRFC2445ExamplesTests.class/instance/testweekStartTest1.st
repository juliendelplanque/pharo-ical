rfc2445-tests
testweekStartTest1
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self weekStartTest1.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 4.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: (#(3 1) includes: eachDate dayOfWeek) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 8
				day: 5
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 8
				day: 24
				hour: 9
				minute: 0
				second: 0)