processing-properties
email:  aString parameters: aDictionary
	| value |
	value := self createEmailAddress: aString parameters: aDictionary.
	self currentCard addEmailAddress: value