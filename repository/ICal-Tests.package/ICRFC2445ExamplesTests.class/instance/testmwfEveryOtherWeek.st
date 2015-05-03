rfc2445-tests
testmwfEveryOtherWeek
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self mwfEveryOtherWeek.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	generatedDates := schedule dates.

	self assert: generatedDates size equals: 25.
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
				day: 22
				hour: 9
				minute: 0
				second: 0)