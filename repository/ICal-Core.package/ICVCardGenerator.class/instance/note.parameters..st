processing-properties
note: aString parameters: aDictionary
	| notes |
	notes := self createValue: aString parameters: aDictionary default: String iCalType.
	self currentCard addNote: notes.