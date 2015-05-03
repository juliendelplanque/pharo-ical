processing-properties
nickname:  aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self currentCard nickname: value