rfc2445-tests
testmonthyFirstAndLastDayFor10
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self monthyFirstAndLastDayFor10.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates
		do: [ :eachDate | self assert: (eachDate dayOfMonth = 1 or: [ eachDate dayOfMonth = eachDate daysInMonth ]) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 30
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 2
				day: 1
				hour: 9
				minute: 0
				second: 0)