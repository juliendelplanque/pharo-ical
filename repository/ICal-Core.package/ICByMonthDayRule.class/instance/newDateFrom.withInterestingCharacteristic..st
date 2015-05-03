growing
newDateFrom: aDateAndTime withInterestingCharacteristic: dayOfMonth
|dayToUse|
dayToUse := dayOfMonth <0 ifTrue: [aDateAndTime daysInMonth + dayOfMonth +1 ] ifFalse: [dayOfMonth ].
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: (self monthFor: aDateAndTime)
		day: dayToUse
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)