processing-properties
xaim:  aString parameters: aDictionary
	| value |
	value := self createAIMId: aString parameters: aDictionary.
	self currentCard addAimid: value