processing-properties
exrule: aString parameters: aDictionary
	| value |
	value := self createValue: aString parameters: aDictionary default: ICRecurrenceRule iCalType.
	self tempComponent addExclusionRule: value