rfc2445-tests
testfirstSatAfterFirstSunForever
	| schedule generatedDates months end scheduleDuration |
	event addRecurrenceRule: self firstSatAfterFirstSunForever.
	schedule := ICSchedule fromEvent: event.
	end := self dateAndTimeClass
		year: 1998
		month: 7
		day: 1
		hour: 9
		minute: 0
		second: 0.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 10.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate dayOfWeek equals: 7.
			self assert: eachDate dayOfMonth > 6.
			self assert: eachDate dayOfMonth < 14 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 13
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 6
				day: 13
				hour: 9
				minute: 0
				second: 0)