enumerating
ensureDatesEndCorrectly
	
	^ datesInProcess isEmpty
		ifTrue: [ datesInProcess ]
		ifFalse: [self endDate trimEndOf: datesInProcess ]