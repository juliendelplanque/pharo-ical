rfc2445-tests
testeveryOtherYearJanFebMarFor10
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self everyOtherYearJanFebMarFor10.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates
		do: [ :eachDate | 
			self assert: (#(1 2 3) includes: eachDate month).
			self assert: eachDate dayOfMonth equals: event start dayOfMonth ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 3
				day: 10
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 2003
				month: 3
				day: 10
				hour: 9
				minute: 0
				second: 0)