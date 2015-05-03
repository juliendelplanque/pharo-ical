years
newDateForYearContaining:  aDateAndTime on: aDayOfYear
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
	
		day: aDayOfYear
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)