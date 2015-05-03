as yet unclassified
ordinalIsPossible
	^ recurringSchedule isYearly or: [ recurringSchedule isMonthly or: [ recurringSchedule isWeekly ] ]