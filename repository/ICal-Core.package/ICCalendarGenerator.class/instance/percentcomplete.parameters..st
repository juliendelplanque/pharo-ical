processing-properties
percentcomplete: aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: Integer iCalType.
	self tempComponent percentComplete: value