processing-properties
exdate: aString parameters: aDictionary
	| dates |
	dates := self
		createMulitValue: aString
		parameters: aDictionary
		type: DateAndTime iCalType.
	self tempComponent exclusionDates: dates