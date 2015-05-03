as yet unclassified
applyRulesTo: aCollectionOfDates
	^ recurringSchedule isYearly
		ifTrue: [ 
			
			weekStart := recurringSchedule weekStart.
			self modifyConsideringOrdinalDayOfWeek: aCollectionOfDates ]