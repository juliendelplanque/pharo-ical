processing-properties
dtstart: aString parameters: aDictionary
	| value |
	value := self createDateAndTime: aString parameters: aDictionary.
	self topStack start: value