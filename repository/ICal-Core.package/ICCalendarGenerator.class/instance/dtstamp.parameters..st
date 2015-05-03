processing-properties
dtstamp: aString parameters: aDictionary
	| value |
	value := self createDateAndTime: aString parameters: aDictionary.
	self tempComponent stamp: value