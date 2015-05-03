as yet unclassified
newDateFrom: aDateAndTime withInterestingCharacteristic: dayOfYear
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		day: dayOfYear
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)