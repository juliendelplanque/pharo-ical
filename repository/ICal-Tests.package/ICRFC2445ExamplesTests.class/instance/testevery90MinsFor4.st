rfc2445-tests
testevery90MinsFor4
	| schedule dates timespan end nextDate duration count generatedDates |
	event addRecurrenceRule: self every90MinsFor4.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	nextDate := event start.
	count := 4.
	duration := self durationClass seconds: 60 * 90.
	end := nextDate + (duration * count).
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
				hour: 13
				minute: 30
				second: 0)