as yet unclassified
occurrenceAfter: aDateAndTime
	| nextMonth nextYear nextDay month |
	nextYear := aDateAndTime year + self interval.
	nextDay := aDateAndTime dayOfMonth.
	month := self dateAndTimeClass year: nextYear month: aDateAndTime month day: 1 hour: 0 minute: 0 second: 0 offset: aDateAndTime offset.
	nextDay := month daysInMonth < nextDay
		ifTrue: [ month daysInMonth ]
		ifFalse: [ nextDay ].
	^ self dateAndTimeClass
		year: nextYear
		month: aDateAndTime month
		day: nextDay
		hour: aDateAndTime hour
		minute: aDateAndTime minute
		second: aDateAndTime second
		 offset: aDateAndTime offset