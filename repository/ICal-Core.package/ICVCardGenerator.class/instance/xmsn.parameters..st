processing-properties
xmsn:  aString parameters: aDictionary
	| value |
	value := self createMSNId: aString parameters: aDictionary.
	self currentCard addMsnid: value