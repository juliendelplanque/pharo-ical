testing
startsInHour: aDateAndTime
	^ self due between: aDateAndTime and: aDateAndTime + (self durationClass seconds: 3600)