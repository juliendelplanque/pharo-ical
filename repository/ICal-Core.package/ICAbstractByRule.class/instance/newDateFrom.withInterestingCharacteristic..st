growing
newDateFrom: aDateAndTime withInterestingCharacteristic: characteristic
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: (self monthFor: aDateAndTime)
		day: (self dayOfMonthFor: aDateAndTime)
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)