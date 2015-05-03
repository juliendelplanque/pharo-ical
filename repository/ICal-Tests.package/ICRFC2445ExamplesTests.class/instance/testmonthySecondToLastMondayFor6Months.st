rfc2445-tests
testmonthySecondToLastMondayFor6Months
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self monthySecondToLastMondayFor6Months.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: 6.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeekName equals: #Monday ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 22
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 2
				day: 16
				hour: 9
				minute: 0
				second: 0)