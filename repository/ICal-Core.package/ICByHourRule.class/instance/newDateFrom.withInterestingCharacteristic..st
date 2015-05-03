growing
newDateFrom: aDateAndTime withInterestingCharacteristic: hour
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: (self monthFor: aDateAndTime)
		day: (self dayOfMonthFor: aDateAndTime)
		hour: hour
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)