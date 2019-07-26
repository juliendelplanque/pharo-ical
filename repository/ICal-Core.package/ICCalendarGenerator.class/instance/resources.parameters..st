processing-properties
resources: aString parameters: aDictionary
	| resources |
	resources := self
		createMulitValue: aString
		parameters: aDictionary
		type: String iCalType.
	self tempComponent resources: resources