rfc2445-tests
testdailyUntilDec241997
	| schedule dates timespan end nextDate oneDay generatedDates |
	event addRecurrenceRule: self dailyUntilDec241997.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	nextDate := event start.
	end := self dateAndTimeClass
		year: 1997
		month: 12
		day: 24
		hour: 0
		minute: 0
		second: 0.
	oneDay := self durationClass seconds: 86400.
	[ nextDate < end ]
		whileTrue: [ 
			dates add: nextDate.
			nextDate := nextDate + oneDay ].
	generatedDates := schedule dates.
	generatedDates doWithIndex: [ :eachDate :index | self assert: eachDate equals: (dates at: index) ].
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
				day: 23
				hour: 9
				minute: 0
				second: 0)