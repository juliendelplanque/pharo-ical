processing-properties
priority: aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: Integer iCalType.
	self tempComponent priority: value