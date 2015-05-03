processing-properties
description: aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self tempComponent addTextualDescription: value