processing-properties
tzname: aString parameters: aDictionary
	| value |
	value := ICTimezoneName fromICalString: aString parameters: aDictionary.
	self topStack addName: value