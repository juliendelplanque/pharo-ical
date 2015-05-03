events
eventsForDateAndTime: aDateAndTime 
	^self events select: [ :each | each startsInHour: aDateAndTime]