testing
startsInHour: aDateAndTime 
	^aDateAndTime <= self due
		and: [(aDateAndTime + (self durationClass seconds: 3600)) >= self due]