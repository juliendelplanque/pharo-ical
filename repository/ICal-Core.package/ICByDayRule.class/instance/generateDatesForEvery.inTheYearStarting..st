growing
generateDatesForEvery: byValue inTheYearStarting: existingDates
	| lastDay nextDay dates startDate |
	startDate := existingDates first.
	dates := OrderedCollection new.
	byValue isString
		ifTrue: [ 
			lastDay := startDate daysInYear.
			nextDay := self nextOccuranceOf: byValue starting: startDate plus: startDate dayOfYear.
			[ nextDay <= lastDay ]
				whileTrue: [ 
					dates add: (self newDateForYearContaining: startDate on: nextDay).
					nextDay := nextDay + 7 ] ]
		ifFalse: [ 
			nextDay := self ordinalOccuranceOf: byValue inSamePeriodAs: startDate limitedTo: startDate daysInYear.
			dates add: (self newDateForYearContaining: startDate on: nextDay) ].
	^ dates