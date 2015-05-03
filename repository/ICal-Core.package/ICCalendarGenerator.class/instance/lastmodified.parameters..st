processing-properties
lastmodified: aString parameters: aDictionary
	| value |
	value := self createDateAndTime: aString parameters: aDictionary.
	self tempComponent lastModified: value