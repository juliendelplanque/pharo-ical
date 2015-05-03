processing-properties
completed: aString parameters: aDictionary
	| value |
	value := self createDateAndTime: aString parameters: aDictionary.
	self tempComponent completed: value