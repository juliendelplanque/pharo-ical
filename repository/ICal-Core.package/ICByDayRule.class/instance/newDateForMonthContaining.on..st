months
newDateForMonthContaining: aDateAndTime on: aDayOfMonth
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: (self monthFor: aDateAndTime)
		day: aDayOfMonth
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)