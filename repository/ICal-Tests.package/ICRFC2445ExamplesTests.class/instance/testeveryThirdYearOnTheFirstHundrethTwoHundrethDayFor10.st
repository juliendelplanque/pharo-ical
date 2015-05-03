rfc2445-tests
testeveryThirdYearOnTheFirstHundrethTwoHundrethDayFor10
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self everyThirdYearOnTheFirstHundrethTwoHundrethDayFor10.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: (#(1 100 200) includes: eachDate dayOfYear) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 1
				day: 1
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 2006
				month: 1
				day: 1
				hour: 9
				minute: 0
				second: 0)