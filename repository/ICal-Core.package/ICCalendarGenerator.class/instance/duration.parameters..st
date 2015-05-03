processing-properties
duration: aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: Duration iCalType.
	self activeComponent duration: value