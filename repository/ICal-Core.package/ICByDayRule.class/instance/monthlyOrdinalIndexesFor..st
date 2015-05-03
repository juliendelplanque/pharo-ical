ordinal
monthlyOrdinalIndexesFor: aDateAndTime
	| iterator fromStartIndex fromEndIndex |
	fromStartIndex := (aDateAndTime dayOfMonth / 7.0) ceiling.
	fromEndIndex := ((aDateAndTime dayOfMonth - aDateAndTime daysInMonth) / 7.0) ceiling - 1.
	^ Array with: fromStartIndex with: fromEndIndex