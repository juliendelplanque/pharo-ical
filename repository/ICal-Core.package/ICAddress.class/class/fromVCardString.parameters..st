instance creation
fromVCardString: aString parameters: aDictionary
	| instance parts |
	instance := self new.
	instance types: (self parseTypes: aDictionary).
	parts := aString  subStringsFull: #($;).
	instance poBox: (String fromVCardString: parts first parameters: aDictionary).
	instance extended: (String fromVCardString: parts second parameters: aDictionary).
	instance street: (String fromVCardString: parts third parameters: aDictionary).
	
	parts size >= 4 ifTrue: [
		instance locality: (String fromVCardString: parts fourth parameters: aDictionary) ].
	parts size >= 5 ifTrue: [
		instance region: (String fromVCardString: parts fifth parameters: aDictionary) ].
	parts size >= 6 ifTrue: [
		instance postalcode: (String fromVCardString: parts sixth parameters: aDictionary) ].
	parts size >= 7 ifTrue: [
		instance country: (String fromVCardString: parts seventh parameters: aDictionary) ].
	^instance