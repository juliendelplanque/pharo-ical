processing-properties
class: aString parameters: aDictionary 
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self tempComponent classification: value