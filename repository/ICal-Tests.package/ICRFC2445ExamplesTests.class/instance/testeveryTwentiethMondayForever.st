rfc2445-tests
testeveryTwentiethMondayForever
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self everyTwentiethMondayForever.
	schedule := ICSchedule fromEvent: event.
		end := self dateAndTimeClass
		year: 1999
		month: 6
		day: 1
		hour: 9
		minute: 0
		second: 0.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 3.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeekName equals: #Monday ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 5
				day: 19
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1999
				month: 5
				day: 17
				hour: 9
				minute: 0
				second: 0)