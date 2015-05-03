processing-properties
attach: aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: ZnUrl iCalType.
	self activeComponent addAttachment: value