processing-properties
version:  aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: Float iCalType.
	self currentCard version: value