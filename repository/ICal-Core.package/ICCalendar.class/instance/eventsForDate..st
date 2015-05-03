events
eventsForDate: aDate 
	^self events select: [ :each | each isValidForDate: aDate]