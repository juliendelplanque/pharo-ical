processing-properties
tzoffsetfrom: aString parameters: aDictionary
	| value |
	value := ICUtcOffset fromICalString: aString parameters: aDictionary.
	self tempTime offsetFrom: value