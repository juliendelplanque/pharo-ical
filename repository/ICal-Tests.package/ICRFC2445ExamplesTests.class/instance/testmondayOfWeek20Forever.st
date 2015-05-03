rfc2445-tests
testmondayOfWeek20Forever
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self mondayOfWeek20Forever.
	schedule := ICSchedule fromEvent: event.
	years := 3.
	scheduleDuration := self durationClass seconds: 86400 * years * 365.
	end := event start + scheduleDuration.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: years.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: 2 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 5
				day: 12
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