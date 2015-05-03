processing-properties
bday:  aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: Date iCalType.
	self currentCard birthday: value