rfc2445-tests
testtuThEveryOtherWeekFor8
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self tuThEveryOtherWeekFor8.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 8.
	generatedDates := schedule dates.
	generatedDates do: [ :eachDate | self assert: (#(3 5) includes: eachDate dayOfWeek) ].
	self assert: generatedDates size equals: count.
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
				month: 10
				day: 16
				hour: 9
				minute: 0
				second: 0)