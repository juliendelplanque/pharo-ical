processing-properties
repeat: aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: Integer iCalType.
	self tempAlarm repetitions: value