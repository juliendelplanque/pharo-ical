processing-properties
tz: aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: ICUtcOffset iCalType.
	self currentCard timeZone: value