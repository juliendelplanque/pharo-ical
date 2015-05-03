ordinal
ordinalIndexesFor: aDateAndTime 
	^recurringSchedule isMonthly ifTrue: [self monthlyOrdinalIndexesFor: aDateAndTime ] ifFalse: [self yearlyOrdinalIndexesFor: aDateAndTime ]