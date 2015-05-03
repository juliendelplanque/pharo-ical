processing-properties
categories: aString parameters: aDictionary
	| categories |
	categories := self createMulitValue: aString parameters: aDictionary class: ICCategory.
	self currentCard categories: categories.