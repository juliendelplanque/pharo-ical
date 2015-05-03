utilities
createValue: aString parameters: aDictionary type: iCalType
	^(ICConversion propertyClassFor: iCalType)
		fromVCardString: aString parameters: aDictionary