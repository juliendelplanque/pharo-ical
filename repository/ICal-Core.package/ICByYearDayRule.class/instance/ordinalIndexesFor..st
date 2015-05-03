as yet unclassified
ordinalIndexesFor: eachDate
	| index |
	index := eachDate dayOfYear.
	^ Array with: index with: index - eachDate daysInYear