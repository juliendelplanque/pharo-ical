utilities
createValue: aString parameters: aDictionary type: iCalType
	^(ICConversion propertyClassFor: iCalType)
		fromICalString: aString parameters: aDictionary