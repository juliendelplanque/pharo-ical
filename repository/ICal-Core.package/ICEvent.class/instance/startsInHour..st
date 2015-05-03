testing
startsInHour: aDateAndTime
	^ self start between: aDateAndTime and: aDateAndTime + (self durationClass seconds: 3600)