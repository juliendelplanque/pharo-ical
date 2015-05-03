as yet unclassified
newDateFrom: aDateAndTime withInterestingCharacteristic: weekOfYear
	| monthAndDay |
	monthAndDay := self nearestMonthAndDayFor: weekOfYear to: aDateAndTime.
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: monthAndDay first
		day: monthAndDay last
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)