processing-properties
url: aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: ZnUrl iCalType.
	self tempComponent url: value