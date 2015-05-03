utilities
createMulitValue: aString parameters: aDictionary class: aClass
	^ (self splitAtCommas: aString) collect: [ :each |
		aClass fromVCardString: each parameters: aDictionary ]