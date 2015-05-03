testing
startsInHour: aDateAndTime 
	^aDateAndTime <= self start
		and: [(aDateAndTime + (self durationClass seconds: 3600)) >= self start ]