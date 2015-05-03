growing
datesForMonthFrom: existingDates with: byValue
	| lastDay nextDay dates startOfMonth  |
	^ existingDates
		gather: [ :eachExistingDate | 
			startOfMonth :=self startOfMonthFor: eachExistingDate .
			dates := OrderedCollection new.
			lastDay := startOfMonth daysInMonth.
			byValue isString
				ifTrue: [ 
					
					nextDay := self nextOccuranceOf: byValue starting: startOfMonth plus: 1.
					nextDay > lastDay
						ifTrue: [ nextDay := nextDay - 7 ].
					[ nextDay <= lastDay ]
						whileTrue: [ 
							dates add: (self newDateForMonthContaining: startOfMonth on: nextDay).
							nextDay := nextDay + 7 ] ]
				ifFalse: [ 
					nextDay := self ordinalOccuranceOf: byValue inSamePeriodAs: startOfMonth limitedTo: lastDay.
					dates add: (self newDateForMonthContaining: startOfMonth on: nextDay) ].
			dates ]