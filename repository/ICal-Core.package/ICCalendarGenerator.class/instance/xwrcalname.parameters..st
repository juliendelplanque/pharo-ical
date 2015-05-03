processing-properties
xwrcalname: aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	calendar name: value