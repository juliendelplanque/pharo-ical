processing-properties
n:  aString parameters: aDictionary
	| value |
	value := self createName: aString parameters: aDictionary.
	self currentCard name: value