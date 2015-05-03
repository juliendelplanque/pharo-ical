as yet unclassified
ordinalIndexesFor: eachDate
	| index weeksOfYear |
	weeksOfYear := self weeksOfYearFor: eachDate.
	index := 0.
	weeksOfYear
		detect: [ :each | 
			index := index + 1.
			each includes: eachDate ].
	^ Array with: index with: index - weeksOfYear size