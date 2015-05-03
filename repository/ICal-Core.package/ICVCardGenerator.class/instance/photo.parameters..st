processing-properties
photo:  aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: ZnUrl iCalType.
	self currentCard photo: value