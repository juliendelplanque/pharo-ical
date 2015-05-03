ordinal
yearlyOrdinalIndexesFor: aDateAndTime

	| iterator fromStartIndex fromEndIndex|
	fromStartIndex := (aDateAndTime dayOfYear /7.0) ceiling.
	fromEndIndex :=((aDateAndTime  dayOfYear - aDateAndTime  daysInYear ) /7.0) ceiling - 1.
	^Array with: fromStartIndex with: fromEndIndex 