rfc2445-tests
testfridayThirteenthForever
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self fridayThirteenthForever.
	schedule := ICSchedule fromEvent: event.
		end := self dateAndTimeClass
		year: 2000
		month: 11
		day: 1
		hour: 9
		minute: 0
		second: 0.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 5.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate dayOfWeek equals: 6.
			self assert: eachDate dayOfMonth equals: 13 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 2
				day: 13
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 2000
				month: 10
				day: 13
				hour: 9
				minute: 0
				second: 0)