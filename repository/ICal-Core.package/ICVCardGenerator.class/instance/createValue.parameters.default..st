utilities
createValue: aString parameters: aDictionary default: aType
	^((aDictionary includesKey: 'ENCODING') and: 
			[ #('B' 'BASE64') includes: (aDictionary at: 'ENCODING') ]) 
			ifFalse: [
				super 
					createValue: aString
					parameters: aDictionary
					default: aType]
		ifTrue: [
			(ICConversion propertyClassFor: 'BINARY')
				fromICalString: aString
				parameters: aDictionary ]