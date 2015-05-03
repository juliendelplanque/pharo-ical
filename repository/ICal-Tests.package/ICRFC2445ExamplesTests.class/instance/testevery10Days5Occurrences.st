rfc2445-tests
testevery10Days5Occurrences
	| schedule dates timespan end nextDate duration generatedDates |
	event addRecurrenceRule: self every10Days5Occurrences.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	nextDate := event start.
	duration := self durationClass seconds: 864000.
	end := nextDate + (duration * 4).
	[ nextDate <= end ]
		whileTrue: [ 
			dates add: nextDate.
			nextDate := nextDate + duration ].
	generatedDates := schedule dates.
	generatedDates doWithIndex: [ :eachDate :index | self assert: eachDate equals: (dates at: index) ].
	self assert: generatedDates size equals: 5.
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
				day: 12
				hour: 9
				minute: 0
				second: 0)