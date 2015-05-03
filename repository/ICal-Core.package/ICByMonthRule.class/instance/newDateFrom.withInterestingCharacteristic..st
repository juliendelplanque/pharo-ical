as yet unclassified
newDateFrom: aDateAndTime withInterestingCharacteristic: month
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: month
		day: (self dayOfMonthFor: aDateAndTime)
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)