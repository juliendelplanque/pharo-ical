processing-properties
org:  aString parameters: aDictionary
	| value |
	value := self createOrganization: aString parameters: aDictionary.
	self currentCard organization: value