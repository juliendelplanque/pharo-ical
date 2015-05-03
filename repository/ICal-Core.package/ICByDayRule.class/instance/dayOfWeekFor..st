as yet unclassified
dayOfWeekFor: eachDate
	| weekStartIndex dayOfWeek index |
	dayOfWeek := eachDate dayOfWeek.
	recurringSchedule isWeekly
		ifTrue: [ 
			weekStartIndex := self dayLetterCodes indexOf: weekStart.
			^ dayOfWeek >= weekStartIndex
				ifTrue: [ dayOfWeek - weekStartIndex + 1 ]
				ifFalse: [ #(1 2 3 4 5 6 7) atWrap: weekStartIndex + dayOfWeek ] ]
		ifFalse: [ ^ dayOfWeek ]