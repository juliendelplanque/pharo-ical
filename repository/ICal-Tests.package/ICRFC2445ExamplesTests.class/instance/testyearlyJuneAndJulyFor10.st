rfc2445-tests
testyearlyJuneAndJulyFor10
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self yearlyJuneAndJulyFor10.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	generatedDates do: [ :eachDate | self assert: (#(6 7) includes: eachDate month) ].
	self assert: generatedDates size equals: count.
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 6
				day: 10
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 2001
				month: 7
				day: 10
				hour: 9
				minute: 0
				second: 0)