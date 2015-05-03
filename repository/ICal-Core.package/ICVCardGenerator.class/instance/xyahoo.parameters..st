processing-properties
xyahoo:  aString parameters: aDictionary
	| value |
	value := self createYahooId: aString parameters: aDictionary.
	self currentCard addYahooid: value