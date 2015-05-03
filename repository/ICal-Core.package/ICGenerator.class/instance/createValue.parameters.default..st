utilities
createValue: aString parameters: aDictionary default: aType
	| iCalType |
	iCalType := aDictionary at: 'VALUE' ifAbsent: [ aType ].
	^self createValue: aString parameters: aDictionary type: iCalType