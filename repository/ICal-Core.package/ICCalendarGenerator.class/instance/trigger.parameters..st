processing-properties
trigger: aString parameters: aDictionary
	| value |
	value := ICTrigger fromICalString: aString parameters: aDictionary.
	self tempAlarm trigger: value