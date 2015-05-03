growing
ordinalOccuranceOf: byValue inSamePeriodAs: startDate limitedTo: atMost
	| dayOfWeek nextDay firstAndLast ordinal start stop step ordinalStep |
	dayOfWeek := self weekDayNumberFor: byValue key.
	ordinal := byValue value.
	firstAndLast := atMost > 31
		ifTrue: [ self firstAndLast: dayOfWeek forYearIncluding: startDate ]
		ifFalse: [ self firstAndLast: dayOfWeek forMonthIncluding: startDate ].
	ordinal > 0
		ifTrue: [ 
			start := firstAndLast first.
			stop := firstAndLast last.
			step := 7.
			ordinalStep := -1 ]
		ifFalse: [ 
			start := firstAndLast last.
			stop := firstAndLast first.
			step := -7.
			ordinalStep := 1 ].
	start to: stop by: step do: [ :each | 
		ordinal := ordinal + ordinalStep.
		ordinal = 0
			ifTrue: [ ^ each ] ]