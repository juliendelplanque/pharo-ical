processing-properties
resources: aString parameters: aDictionary
	| resources |
	resources := self createMulitValue: aString parameters: aDictionary type: String.
	self tempComponent resources: resources