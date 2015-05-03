as yet unclassified
ordinalIndexesFor: eachDate
	| index |
	index := eachDate dayOfMonth.
	^ Array with: index with: index - eachDate daysInMonth