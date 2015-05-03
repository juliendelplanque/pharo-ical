processing-properties
tel:  aString parameters: aDictionary
	| value |
	value := self createPhoneNumber: aString parameters: aDictionary.
	self currentCard addPhoneNumber: value