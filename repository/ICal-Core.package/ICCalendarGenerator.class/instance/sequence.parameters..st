processing-properties
sequence: aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: Integer iCalType.
	self tempComponent sequenceNumber: value