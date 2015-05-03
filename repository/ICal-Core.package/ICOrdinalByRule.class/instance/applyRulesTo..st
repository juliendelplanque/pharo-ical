as yet unclassified
applyRulesTo: aCollectionOfDates
	self setWeekStart.
	
	^ self ordinalIsPossible
		ifTrue: [ self modifyConsideringOrdinalDayOfWeek: aCollectionOfDates ]
		ifFalse: [ super modify: aCollectionOfDates ]