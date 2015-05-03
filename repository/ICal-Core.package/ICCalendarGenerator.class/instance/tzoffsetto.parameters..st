processing-properties
tzoffsetto: aString parameters: aDictionary
	| value |
	value := ICUtcOffset fromICalString: aString parameters: aDictionary.
	self tempTime offsetTo: value