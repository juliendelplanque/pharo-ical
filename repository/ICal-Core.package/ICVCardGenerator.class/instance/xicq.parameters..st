processing-properties
xicq:  aString parameters: aDictionary
	| value |
	value := self createICQId: aString parameters: aDictionary.
	self currentCard addIcqid: value