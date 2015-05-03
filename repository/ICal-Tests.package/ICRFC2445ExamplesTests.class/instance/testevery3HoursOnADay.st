rfc2445-tests
testevery3HoursOnADay
	| schedule dates timespan end nextDate duration generatedDates |
	event addRecurrenceRule: self every3HoursOnADay.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	nextDate := event start.
	duration := self durationClass seconds: 3600 * 3.
	end := self every3HoursOnADay repetition.
	[ nextDate < end ]
		whileTrue: [ 
			dates add: nextDate.
			nextDate := nextDate + duration ].
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
				month: 9
				day: 2
				hour: 15
				minute: 0
				second: 0)