as yet unclassified
newDateFrom: aDateAndTime withInterestingCharacteristic: minute
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: (self monthFor: aDateAndTime)
		day: (self dayOfMonthFor: aDateAndTime)
		hour: (self hourFor: aDateAndTime)
		minute: minute
		second: (self secondFor: aDateAndTime)