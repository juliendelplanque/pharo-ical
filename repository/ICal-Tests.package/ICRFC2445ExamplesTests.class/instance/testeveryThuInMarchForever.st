rfc2445-tests
testeveryThuInMarchForever
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self everyThuInMarchForever.
	schedule := ICSchedule fromEvent: event.
	end:=(self dateAndTimeClass year: 1999 month:4  day: 1 hour: 9 minute:0  second:0 ).
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 11.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate dayOfWeek equals: 5.
			self assert: eachDate month equals: 3 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 3
				day: 13
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1999
				month: 3
				day: 25
				hour: 9
				minute: 0
				second: 0)