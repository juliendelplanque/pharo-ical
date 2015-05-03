processing-properties
created: aString parameters: aDictionary
	| value |
	value := self createDateAndTime: aString parameters: aDictionary.
	self tempComponent created: value