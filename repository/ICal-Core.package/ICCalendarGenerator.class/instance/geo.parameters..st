processing-properties
geo: aString parameters: aDictionary
	| value |
	value := Point fromICalString: aString.
	self currentCard geo: value