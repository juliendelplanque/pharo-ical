processing-properties
version: aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: Float iCalType.
	self calendar version: value