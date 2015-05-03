rfc2445-tests
testevery15MinsFor6
	| schedule dates timespan end nextDate duration count generatedDates |
	event addRecurrenceRule: self every15MinsFor6.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	nextDate := event start.
	count := 6.
	duration := self durationClass seconds: 60 * 15.
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
				hour: 10
				minute: 15
				second: 0)