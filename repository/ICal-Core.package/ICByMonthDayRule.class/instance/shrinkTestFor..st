as yet unclassified
shrinkTestFor: eachDate
	| indexes |
	indexes := self ordinalIndexesFor: eachDate.
	^ self byValues anySatisfy: [ :eachValue | indexes includes: eachValue ]