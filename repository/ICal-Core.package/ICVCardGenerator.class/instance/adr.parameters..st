processing-properties
adr:  aString parameters: aDictionary
	| value |
	value := self createAddress: aString parameters: aDictionary.
	self currentCard addAddress: value