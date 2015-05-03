utilities
createMulitValue: aString parameters: aDictionary type: aClass
	^ (self splitAtCommas: aString) collect: [ :each |
		self createValue: each parameters: aDictionary default: aClass ]