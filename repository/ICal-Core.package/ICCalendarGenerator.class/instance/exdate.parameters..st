processing-properties
exdate: aString parameters: aDictionary
	| dates |
	dates := self createMulitValue: aString parameters: aDictionary type: DateAndTime.
	self tempComponent exclusionDates: dates