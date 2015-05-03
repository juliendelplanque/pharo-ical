rfc2445-tests
testeveryThuInJunJulAugForever
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self everyThuInJunJulAugForever.
	schedule := ICSchedule fromEvent: event.
	end:=	(self dateAndTimeClass
				year: 1999
				month: 12
				day: 31
				hour: 9
				minute: 0
				second: 0).
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 39.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate dayOfWeek equals: 5.
			self assert: (#(6 7 8) includes: eachDate month) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 6
				day: 5
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1999
				month: 8
				day: 26
				hour: 9
				minute: 0
				second: 0)