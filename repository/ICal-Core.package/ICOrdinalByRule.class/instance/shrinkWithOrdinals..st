shrink
shrinkWithOrdinals: aCollectionOfDates
	^ aCollectionOfDates removeAllSuchThat: [ :eachDate | self ordinalShrinkTestFor: eachDate ]