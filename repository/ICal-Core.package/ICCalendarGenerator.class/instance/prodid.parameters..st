processing-properties
prodid: aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self calendar productId: value